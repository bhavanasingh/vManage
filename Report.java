package inventory;
import java.sql.*;
import java.util.*;



/* This Class represents a report. It generates report about a particular item. The report can be generated at the request of the user. Return Type of generatereport is List<> . Input:Connection and the Item Id (for which a report is needed).

It has all the information regarding the Itemid passed.
*/

public class Report{

  	
	int id;
//	Date generate;
	

	List<String> notification;
	public List<String> generatereport(Connection Con,int intd)
	{
				
		notification=new ArrayList<String>();		
		
		try{
			Statement stmt=Con.createStatement();
			
			String queryinsert="select * from Item where Item_id="+intd+";";
			ResultSet rs=stmt.executeQuery(queryinsert);
				
		while(rs.next())
		{
			
			String st="The Item Name:"+rs.getString("Item_name")+"item id:"+rs.getString("Item_id")+"brandis: "+rs.getString("Brand")+" Status:"+rs.getString("Status")+"\n";			
			notification.add(st);
		}
		}
		catch(SQLException e)
		{
		}
		return notification;
		
	}

}

		
