package inventory;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class SellItem {
  List <String> sold;
	public int nbrSold;
	
	public void getList(Connection con)
	{
		
		try{
		sold =new ArrayList<String>();
		Statement stmt=con.createStatement();		
		String query="update Item set Quantity = Quantity - "+nbrSold+";";
		
		ResultSet rs=stmt.executeQuery(query);
				
		while(rs.next())
		{s
			
			//String st="The Item Name:"+rs.getString("Item_name")+" "+"having item id:"+rs.getString("Item_id")+"is about to expire in the next 30 days . Take the needed action"+"\n";		
			String st="The Item Name:"+rs.getString("Item_name")+" "+"having item id:"+rs.getString("Item_id")+"has been sold with the quantity "+nbrSold+"\n";			

			sold.add(st);
		}
		
		}
		catch(SQLException e)
		{
		}	
	}
	public void readList()
	{
			System.out.println(sold);
	}
}
