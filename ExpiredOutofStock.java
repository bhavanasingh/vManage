package inventory;
import java.sql.*;
import java.util.*;


/*
@Author:pvijay
Interface Definitions
*/

public interface ExpiredOutofStock{

  public List<String> getExpiredItems(Connection Con);
	
	
			
	public List<String> getOutofStockItems(Connection Con);
				
}
