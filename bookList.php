<?
//require_once("../include/LoginSession.php");
//require_once("../include/textParsing.php");
//require_once("common.php");
require_once("include/layout.php");
require_once("include/db_connect.php");

class BookList
{
	var $id;
	var $userId;
	var $name;
	var $desc;
	var $row;
	var $db;

	var $query;
	var $layout;
	var $theLoginSession;
	var $cmd;
	var $count;
	var $parser;

	// Constructor ------------------------------------------------------------
	function BookList()
	{
		$this->parseGET();
		$this->parsePOST();
		
		if ($this->cmd == "")
			$this->cmd = "show";


/*		if (($this->id == "") && ($this->cmd != "create"))
		{
			echo("<span class='error'>Too few arguments. Exiting.</span>");
			exit();
		}
		
*/
		$this->db = new dbConnect();
		$this->table = "BookList";

	//	$this->theLoginSession = new LoginSession;
	//	$this->theLoginSession->validate();

		$this->layout = new Layout();

	//	$this->parser = new TextParsing();

		//$this->userId = $this->theLoginSession->getUser();
		//$this->userId = $this->userId[0];
		//echo("User: " . $this->userId . "<br>");

		 
		
		switch($this->cmd)
		{
			case "create":
				$this->cmdCreate();
				break;
			case "destroy":
				$this->cmdDestroy();
				header("Location: bookList.php?cmd=show&id=" . $this->id);
				exit();
				//break;
			case "show":
				$this->setHeader();
				$this->cmdShow("");
				break;
			case "showAuthor":
				$this->setHeader();
				$this->cmdShow("author");
				break;
			case "edit":		
				$this->cmdEdit();
				break;
			case "remove":
				$this->removeListItem();
				header("Location: bookList.php?cmd=show&id=" . $this->id);
				exit();
				//break;
			case "print":
				$this->showList();
				break;
			case "additem":
				$this->addListItem();
				header("Location: bookList.php?cmd=show&id=" . $this->id);
				exit();
				//break;
			case "clear":
				$this->clearList();
				header("Location: bookList.php?cmd=show&id=" . $this->id);
				exit();
				//break;
			case "fill":
				$this->populateList();
				header("Location: bookList.php?cmd=show&id=" . $this->id);
				exit();
			case "setAmount":
				$this->setListItemAmount();
				break;
			default:
				echo("<span class='error'>Command does not exist. Exiting.</span>");
				exit();
		}

	}

	// Parse Querystring ------------------------------------------------------
	function parseGET()
	{
		$this->id = trim($_GET['id']);
		$this->cmd = $_GET['cmd'];
		$this->row = $_GET['row'];
	}

	// Parse Post -------------------------------------------------------------
	function parsePOST()
	{
		$this->name = $_POST['name'];

		$this->count = $_POST['count'];
		if ($this->count != "")
		{
			$this->name = $_POST['listname'];
			$this->desc = $_POST['listdesc'];
		}		
	}

	// Command: Create manufacturer -----------------------------------------------
	function cmdCreate($edit)
	{
		if ($this->theLoginSession->validate()) // �r anv�ndaren inloggad?
		{
			if ($this->count == "true")
			{
				$this->dbInsert($edit);
				exit();
			}
			echo("<center>\n");
			echo("<div id='frame'>\n");
			$this->layout->showHeader();	
			$this->layout->showElector();

			?>
			<div id="center">
			<?
			if ($edit == "true")
				echo("<h1>�ndra shoppinglista</h1>");
			else
				echo("<h1>Skapa ny shoppinglista</h1>");
			$this->showEntryForm();		
			?>
			</div>
			<?
			$this->layout->showAdPane();
			$this->layout->showFooter();
			echo("</div>\n");
			echo("</center>\n");
		}
		else
		{
			echo("<ul>\n<li><span class='error'>You are not logged on.</span></ul>");
			exit();
		}

	}

	// Command: Delete manufacturer -----------------------------------------------
	function cmdDestroy()
	{
		$this->clearList();
		$query = "delete from ShoppingList where id = " . $this->id . ";";
		$result = mysql_query($query);
	}

	// Command: Show manufacturer -------------------------------------------------
	function cmdShow($cmd)
	{	
		$query = "";
		$h1 = "";

		switch($cmd)
		{
			case "author":
			{
				$query = "select name, surname from Author where authorid = " . $this->id . ";";
				$result = $this->db->handle->query($query);

				if ($result->num_rows != 0)
				{
					$row = $result->fetch_row ();
					$auth = $row[0];
					if (trim($row[1]) != "")
					{	$auth .= " ";
						$auth .= $row[1];
					}

					$h1 = $auth;
				}
				$query = "select am.bookID from AuthorMap am, Book b where am.authorID = " . $this->id . " and b.bookID = am.bookID order by b.title;";
				break;		
			}
			default:
			{
				$h1 = "Alla böcker";
				$query = "select bookID from Book order by title asc;";
			}
		}
		//echo("Q: " . $query . "<br>");
		$result = $this->db->handle->query($query);
		$id = "";
		if ($result->num_rows != 0)
		{
			
			while ($row = $result->fetch_row ())
			{
				$id[] = $row[0];
			}
			$id = implode(",",$id);
		}


		
		
		echo("<center>\n");
		//echo("<div id='frame'>\n");
		//$this->layout->showHeader();
		//$this->layout->showElector();
		
		?>
		<div id="center">
		<?
		$this->showMenu();

		$query = "select b.title, r.name, l.bookshelf, l.shelf, o.name, o.surname, b.edition, s.name, bt.name, b.bookID 
from Book b, Room r, Location l, Owner o, Status s, BindingType bt
where
	b.locationID = l.locationID
    and l.roomID = r.roomID 
	and b.ownerID = o.ownerID
    and b.statusID = s.statusID 
    and bt.bindingTypeID = b.bindingTypeID
    and b.bookID in (" . $id . ") 
order by b.title asc, b.edition asc;";
		//echo("Q: " . $query . "<br>");
		$result = $this->db->handle->query($query);
		if ($result->num_rows != 0) {
			echo ("<h1>" . $h1 . " (" . $result->num_rows);
			if ($result->num_rows == 1)
				echo(" bok)");
			else
				echo (" böcker)");
			echo ("</h1>");
					
			echo("<table><tr><th>Titel</th><th>Utgåva</th><th>Bindning</th><th>Rum</th><th>Bokhylla</th><th>Hyllplan</th></tr>\n");
			$i = 0;
	
			while ($row = $result->fetch_row ())
			{
				$title		= $row[0];
				$room		= $row[1];
				$bookCase	= $row[2];
				$shelf		= $row[3];
				$owner		= $row[4];
				if (trim($row[5]) != "")
				{
					$owner .= " ";
					$owner .= $row[5];
				}
				$edition	= $row[6];
				$status		= $row[7];
				$back		= $row[8];	
				$id			= $row[9];


				if (!($i % 2))
					$bgcolor = " class='bg2'";
				else
					$bgcolor = "";

				echo("<tr" . $bgcolor . ">\n
						<td><a href='book.php?cmd=show&id=" . $id . "'>" . $title	. "</a></td>\n
						<td class='center'> "	. $edition	. "</td>\n
						<td nowrap>"					. $back		. "</td>\n
						<td>"					. $room		. "</td>\n
						<td class='center'>"	. $bookCase . "</td>\n
						<td class='center'>"	. $shelf	. "</td>\n

					</tr>\n");

				$i++;
			}
			echo("</table>\n");
		}

		?>
		</div>
		<?
		
		//$this->layout->showAdPane();
		//$this->layout->showFooter();
		echo("</div>\n");
		echo("</center>\n");
	}

	// Command: Edit manufacturer -------------------------------------------------
	function cmdEdit()
	{
		// TODO: Make sure no circular manufacturers can exist.

		$this->cmdCreate("true");
	}

	// Insert a new manufacturer into the database --------------------------------
	function dbInsert($edit)
	{
		echo("User: " . $this->userId . "<br>");
		echo("Name: " . $this->name . "<br>");
		echo("Desc: " . $this->desc . "<br>");
		
		$this->desc =			$this->parser->parseLinebreak($this->desc);
		$this->desc =			$this->parser->parseInvalidCharacters($this->desc);
		$this->name =			$this->parser->parseInvalidCharacters($this->name);

		if ($this->cmd == "edit")
		{
			$query = "update ShoppingList set name = '" . $this->name . "', description = '" . $this->desc . "' where id = " . $this->id . ";";
		}
		else
		{
			$query = "insert into ShoppingList (userid,name,description) values(" . $this->userId . ",'" . $this->name . "','" . $this->desc . "');";
		}
		echo("Q: " . $query . "<br>");
		//exit();
		
		if(mysql_query($query))
		{
			if ($this->id)
				$id = $this->id;
			else
				$id = mysql_insert_id();
		}

		echo("id: " . $id . "<br>");
		//exit();
		header("Location: shoppingList.php?cmd=show&id=" . $id);
		exit();
	}

	function dbDelete()
	{
		$query = ";";
		mysql_query($query);
	}


	function setHeader()
	{
			echo("\t<title>" . utf8_encode("H�pp") );

			echo("</title>\n");
	}

	function showMenu()
	{
		echo("<div id='menuheader'>[ <a href='bookList.php?cmd=show'>" . "Alla böcker" . "</a> ]</div><br><br>");
	}

	function showList()
	{

	}

	function printList()
	{

	}

	function addListItem()
	{

	}

	function removeListItem()
	{

	}

	function setListItemAmount()
	{

	}

	function moveRow()
	{
	}

	function clearList()
	{

	}

	function populateList()
	{

	}

	function getListItems()
	{
		echo("<SELECT name='name'>\n");
		$query = "SELECT name from ListItem where id not in (select itemid from ListRow where shoppinglistid = " . $this->id . ") order by name;";

		$result = mysql_query($query);
		if (mysql_num_rows($result) != 0)
		{
			while ($row = mysql_fetch_row($result))
			{
				echo("<OPTION>" . $row[0] . "</OPTION>\n");
			}			
		}
		echo("</SELECT>\n");
	}

	function showEntryForm()
	{
		?>
<form action='shoppingList.php?cmd=create' method='post'>
<table>
	<tr>
		<td>Namn</td><td><input name='listname' type='edit'></td>
	</tr>
	<tr>
		<td>Beskrivning</td><td><textarea name='listdesc'></textarea></td>
	</tr>
	<tr>
		<td><input type='submit' value='Skapa'></td><td></td>
	</tr>
</table>
<input type='hidden' name='count' value='true'>
</form>
		<?
	}

}

	echo("\r<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n<html>\n<head>\n"); 
	echo("\t<link rel='stylesheet' href='css/backstedt.css' type='text/css'>\n");
	echo("\t<link rel='stylesheet' href='css/print.css' type='text/css' media='print'>\n");
	echo("\t<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>\n");
	//new dbConnect();
	$bookList = new BookList();
?>
