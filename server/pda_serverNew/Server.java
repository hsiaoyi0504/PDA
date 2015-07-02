import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class Server{
   private Vector<ClientThread> clientThreadVec;
   private Vector<Integer> waitBuffer;
   private SimpleDateFormat time;
   private int port;
   private boolean terminate;
   private int num_client;
   private ServerSocket serverSocket;
   
   public Server(){// 140.112.41.137
      port=6789;
      time=new SimpleDateFormat("HH:mm:ss");
      terminate=false;
      num_client=0;
      clientThreadVec=new Vector<ClientThread>();
      waitBuffer=new Vector<Integer>();
   }

   public static void main(String[] args){
      Server server=new Server();
      server.start();
   }
   
   public void start(){
      try{
         serverSocket=new ServerSocket(port);
         while(!terminate){
            display("Server waiting for Clients on port "+ port + "...");
            Socket socket=serverSocket.accept();
            if(terminate) break;
            ClientThread ct=new ClientThread(socket);
            clientThreadVec.add(ct);
            ct.start();
            display(ct.getUsername()+" just connected.");
         }
         try{ stop();}
         catch(Exception e){ display("Exception closing socket: "+e);}
      }
      catch(IOException e){ display("Exception on new ServerSocket: "+e+"\n");}
   } // end of method start()
   
   /*  
    *  Display message with current time on the console
    */
   private void display(String message){
      String currTime="["+time.format(new Date())+"]  "+message;
      System.out.println(currTime);
   }
   
   /*  
    * Try to stop
    */
   private void stop(){
      try{
         serverSocket.close();
         for(int i=0; i<clientThreadVec.size(); i++){
            ClientThread ct=clientThreadVec.get(i);
            try{
               ct.sInput.close();
               ct.sOutput.close();
               ct.socket.close();
            }  
            catch(IOException ioE){ display("Exception closing CT: "+ioE);}
        }
      }
      catch(Exception e){ display("Exception closing ServerSocket: "+e);}
   }
   
   /* 
    * Kick a user out 
    */
   private synchronized boolean kickUser(int id){
      for(int i=0; i<clientThreadVec.size(); i++){
         ClientThread ct=clientThreadVec.get(i);
         if(ct.ID==id){
            clientThreadVec.remove(i);
            display("Remove "+id+" from clientThreadVec.");
            return true;
         }
      }
      return false;
   }

   private synchronized void broadcast(String msg, int id){
      for(int i=0; i<clientThreadVec.size(); i++){
         if(i==id) continue;
         ClientThread ct=clientThreadVec.get(i);
         //display("Broadcasting "+msg);
         if(!ct.writeMessage(msg)){
            clientThreadVec.remove(i);
            display("Disconnect Client "+ct.username+" removed from list.");
         } 
      }
   }

   private synchronized void sendToOne(String msg, int id, int from){
      for(int i=0; i<clientThreadVec.size(); i++){
         ClientThread ct=clientThreadVec.get(i);
         if(ct.getID()==id){
            if(!ct.writeMessage(msg)){
               clientThreadVec.remove(i);
               display("Disconnect Client "+ct.username+"removed from list.");
            }
            display(from+"->"+id+": "+msg);
         }
      }
   }
   
   private synchronized ClientThread getClientThreadByID(int id){
      for(int i=0; i<clientThreadVec.size(); i++){
        ClientThread ct=clientThreadVec.get(i);
        if(ct.getID()==id)
            return ct;
      }
      return null;
   }
   
   
   class ClientThread extends Thread{
      private Socket socket;
      private BufferedReader sInput;
      private DataOutputStream sOutput;
      private int opID;
      private int ID;
      private int icon;
      private int mode;
      private String username;
      private int userLevel;
      private String msg;

      /* Getter */
      public String getUsername(){ return username; }
      public int getID(){ return ID; }
      public void setOpID(int id){ opID=id; }
      public int getIcon(){ return icon; }
      public int getMode(){ return mode; }
      /* Constructor */
      public ClientThread(Socket socket){
         ID=num_client;
         opID=-1;
         num_client++;
         username= Integer.toString(ID);
         icon=0;
         mode=-1;
         this.socket=socket;
         try{
            sOutput=new DataOutputStream(socket.getOutputStream());
            sInput=new BufferedReader(new InputStreamReader(socket.getInputStream()));
            //sInput=new BufferedReader(new InputStreamReader(socket.getInputStream(),"UTF-8"));
         }
         catch(IOException ioE){
            display("Exception creating new I/O Streams: " + ioE);
            return;
         }
      } // end of constructor

      public void run(){
         boolean terminate=false;
         while(!terminate){
            try{ msg= sInput.readLine();}
            catch(IOException e){
               display(username+" Exception reading Streams: "+e);
               break;
            }
            display("[Received] "+username+": "+msg);
            String[] tokens=msg.split(";");
            System.out.println(tokens[0]);
            if(tokens[0].equals("request")){
               username=tokens[1];
               icon=Integer.valueOf(tokens[2]);
               mode=Integer.valueOf(tokens[3]);
               if(waitBuffer.size()==0){
                  waitBuffer.add(ID);
                  display("Add "+ID+" into waitBuffer");
               } else {
                  boolean isPaired=false;
                  for(int i=0; i<waitBuffer.size(); i++){
                     int op=waitBuffer.get(i);
                     ClientThread opCt=getClientThreadByID(op);
                     if(opCt.getMode()==mode){
                        waitBuffer.removeElement(op);
                        opID=op;
                        opCt.setOpID(ID);
                        int opIcon=opCt.getIcon();
                        String opName=opCt.getUsername();
                        sendToOne("confirm;host;"+username+";"+icon,opID, -1);
                        sendToOne("confirm;client;"+opName+";"+opIcon,ID, -1);
                        display("Pair "+ID+", "+opID);
                        isPaired=true;
                        break;
                     } 
                  }
                  if(isPaired==false){
                     waitBuffer.add(ID);
                     display("Add "+ID+" into waitBuffer");
                  }
               }
            }
            else if(tokens[0].equals("OVER")){
               break;
            }
            else if(opID!=-1){
               sendToOne(msg,opID, ID);
            }
            //broadcast(msg,ID);
         } // end of while
         kickUser(ID);
         close();
      } // end of method run()
      
      private void close(){
         try{ if(sOutput!=null) sOutput.close();}
         catch(Exception e){}
         try{ if(sInput!=null) sInput.close();}
         catch(Exception e){}
         try{ if(socket!=null) socket.close();}
         catch(Exception e){}
      } // end of method close()

      private boolean writeMessage(String msg){
         if(!socket.isConnected()){
            close();
            return false;
         }
         try{ sOutput.writeBytes(msg+"\n");}
         //try{ sOutput.writeUTF(msg+"\n");}
         catch(IOException e){
            display("Error sending message to "+username);
            display(e.toString());
            kickUser(ID);
            close();
         }
         return true;
      }
   } // end of inner class ClientThread
}
