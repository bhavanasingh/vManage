package inventory;
import java.util.*;
import java.sql.*;


/* class for adding rules for the medicine stock limits*/
//If Existing rule for a item is there it updates the item rule amount else it adds a new rule.



public class Rule{
  public void Rule(int id,int amount)
	{
		Connection con1;
		
		try{
		con1 = DriverManager.getConnection("jdbc:mysql://localhost/inventory", "root", "password");
//		System.out.println("Connected to the database");
		Statement stmt=con1.createStatement();
		Statement stmtinsert=con1.createStatement();
		Statement stmtupdate=con1.createStatement();
				
		String query="select count(*) from Rule where Item_id="+id+";";
		ResultSet rs=stmt.executeQuery(query);
		
		while(rs.next())
		{
		if(rs.getInt(1)==0)
		{
			String queryinsert="insert into Rule values("+id+","+amount+");";
			stmtinsert.executeUpdate(queryinsert);
		}
		else
		{
			String queryu="update Rule set Consumption_per_month="+amount+" where Item_id="+id+";";
			stmtupdate.executeUpdate(queryu);
		}
			
		}
		}
	catch(Exception e)
	{
		System.out.println("entered");
	}
	}
}
