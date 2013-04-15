package inventory;
import java.sql.*;
import java.util.*;

/* This class generates the Notifications of both the Expiring Good and the OutofStock Items
The function generatenotifications( Connection to database, object of ExpiredList mObject if OutofStockList)


The String Notification has the requried Notification.
The objects are passed from Notify.java
*/


public class Notification{

  	
	int id;
//	Date generate;
	int ack=0;
	List<String> emessage;
	List<String> omessage;
	List<String> notification;
	public List<String> generatenotifications(Connection Con,ExpiredList obje,OutofStockList objo)
	{
				
		notification=new ArrayList<String>();		
		int i=0;
		emessage=obje.getExpiredItems(Con);
		omessage=objo.getOutofStockItems(Con);
		for(i=0;i<emessage.size();i++)
		{
			notification.add(emessage.get(i));
		}
		i=0;
		for(i=0;i<omessage.size();i++)
		{
			notification.add(omessage.get(i));
		}

		return notification;
		
	
	}

}

		
