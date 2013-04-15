package inventory;

import java.util.*;
import java.sql.*;
import inventory.*;

//This is the Main method
// all objects and the connection to the database are initialised and passed as arguments to the respective object functions.

public class Notify{
  public static void main(String[] args){
		int Not_id=0;// notification id;
		ExpiredList iteme=new ExpiredList();
		OutofStockList itemo=new OutofStockList();	
		Notification notify=new Notification();

		List<String> orderreport=new ArrayList<String>();

		Report report=new Report();
		
		List<String> notifications=new ArrayList<String>();

		Connection con1;
		
		try{
		con1 = DriverManager.getConnection("jdbc:mysql://localhost/inventory", "root", "password");
//		System.out.println("Connected to the database");
		notifications=notify.generatenotifications(con1,iteme,itemo);// returns the notification list;
		System.out.println("The notifications "+ notifications);
		
		orderreport=report.generatereport(con1,1);
		System.out.println("The Report"+orderreport);

		
		
		
		}
	catch(Exception e)
	{
		System.out.println("entered");
	}


}
}
