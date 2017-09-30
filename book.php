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
		$this->table = "Book";
		$this->db = new dbConnect ();

	//	$this->theLoginSession = new LoginSession;
	//	$this->theLoginSession->validate();

		$this->layout = new Layout();

		//$this->parser = new TextParsing();

//		$this->userId = $this->theLoginSession->getUser();
//		$this->userId = $this->userId[0];
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
				$this->cmdShow();
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
	function cmdShow()
	{	
		echo("<center>\n");
		//echo("<div id='frame'>\n");
		//$this->layout->showHeader();
		//$this->layout->showElector();
		?>
		<div id="center">
		<?
		//$this->common->checkValidID($this->id, $this->table);
		$query = "select 	b.title, 
		b.originalTitle, 
		b.edition, 
        b.isbn, 
        l.name, 
        o.name, 
        o.surname, 
        s.name, 
        bt.name, 
        r.name, 
        loc.bookshelf, 
        loc.shelf, 
        c.name, 
        p.name, 
        b.published, 
        b.originalpublished
from Book b, Language l, Owner o, Status s, BindingType bt, Room r, Category c, Publisher p, Location loc
where 
	p.publisherID = b.publisherID 
	and b.categoryID = c.categoryID 
	and b.languageID = l.languageID 
    and b.ownerID = o.ownerID 
    and b.statusID = s.statusID 
    and b.bindingTypeID = bt.bindingTypeID 
    and b.locationID = loc.locationID 
    and loc.roomID = r.roomID
and b.bookid = " . $this->id . ";";

		$result = $this->db->handle->query($query);

		if ($result->num_rows != 0)
		{
			
			$row = $result->fetch_row ();
			
			

			$title			= $row[0];
			$originalTitle	= $row[1];
			if (trim($originalTitle) == "")
				$originalTitle = $title;

			$edition		= $row[2];
			$isbn			= $row[3];
			$language		= $row[4];
			$owner			= $row[5];
			if (trim($row[5]) != "")
			{
				$owner .= " ";
				$owner .= $row[6];
			}
			$status			= $row[7];
			$back			= $row[8];
			$room			= $row[9];
			$bookCase		= $row[10];
			$shelf			= $row[11];
			$category		= $row[12];
			$publisher		= $row[13];
			$published		= "";
			if (trim($row[14]))
			{
				$published		= date_create($row[14]);
				$published		= $published->format("Y");
			}
			$origPublished	= "";
			if (trim($row[15]))
			{
				$origPublished	= date_create($row[15]);
				$origPublished	= $origPublished->format("Y");
			}

			$author[]		= "";

			$query = "select a.name, a.surname, a.authorID from Author a, AuthorMap am, Book b where am.authorID = a.authorID and am.bookID = b.bookID and b.bookID = " . $this->id . " order by a.surname asc;";

			$result = $this->db->handle->query($query);

			if ($result->num_rows != 0)
			{
				while ($row = $result->fetch_row ())
				{
					$temp = $row[0];
					if (trim($row[1]))
					{
						$temp .= " ";
						$temp .= $row[1];
						$temp = "<a href='bookList.php?cmd=showAuthor&id=" . $row[2] . "'>" . $temp . "</a>";
					}
					$authors[] = $temp;
				}
				$authors = implode(", ",$authors);
			}
			echo("<h1>" . $title . "</h1>\n");
			echo("<table>\n");
			echo("<tr><th class='property'>Språk</th><td>" . $language	. "</td></tr>\n");
			echo("<tr><th class='property'>Förlag</th><td>" . $publisher	. "</td></tr>\n");
			
			
			if ($title != $originalTitle)
			{
				echo("<tr><th class='property'>Originaltitel</th><td>" . $originalTitle	. "</td></tr>\n");
				
			}

			echo("<tr><th class='property'>Utgåva</th>			<td>" . $edition	. "</td></tr>\n");
			if ($published)
				echo("<tr><th class='property'>Utgiven</th><td>" . $published . "</td></tr>\n");
			if ($published != $origPublished)
				echo("<tr><th class='property'>Originalutgåva</th><td>" . $origPublished . "</td></tr>\n");

			echo("<tr><th class='property'>Kategori</th>								<td>" . $category	. "</td></tr>\n
					<tr><th class='property'>ISBN</th>									<td><a href='https://libris.kb.se/hitlist?p=1&q=" . $isbn . "&t=v&d=libris&s=r&t=v&m=10&f=simp&spell=true'> " . $isbn	. "</a></td></tr>\n
					<tr><th valign='top' class='property'>Författare</th>		<td> " . $authors . "</td></tr>\n
					<tr><th class='property'>Bindning</th>								<td>" . $back		. "</td></tr>\n
					<tr><th class='property'>Rum</th>									<td>" . $room		. "</td></tr>\n
					<tr><th class='property'>Bokhylla</th>								<td>" . $bookCase . "</td></tr>\n
					<tr><th class='property'>Hyllplan</th>								<td>" . $shelf	. "</td></tr>\n
					<tr><th class='property'>Ägare</th>			<td>" . $owner	. "</td></tr>\n
					<tr><th class='property'>Status</th>									<td>" . $status	. "</td></tr>\n");
			echo("</table>\n");
		}

		echo("<a href='bookList.php?cmd=show'>Tillbaka</a>");
		?>
		</div>
		<?
		
		//$this->layout->showAdPane();
		//$this->layout->showFooter();
		//echo("</div>\n");
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
			echo("\t<title>H�pp");

			echo("</title>\n");
	}

	function showList()
	{
		//$query = "select lr.id,li.name,lr.amount from ListRow lr, ListItem li where li.id = lr.itemid and lr.shoppinglistid = " . $this->id . " order by lr.id;"; // different sorting

		$query = "select lr.id,li.name,lr.amount from ListRow lr, ListItem li where li.id = lr.itemid and lr.shoppinglistid = " . $this->id . " order by li.name;";

		$result = mysql_query($query);
		$numrows = 0;
		$maxrows = 1000000;

		if ($this->cmd == "print")
		{
			//$maxrows = 32; // landscape
			$maxrows = 48; // portrait
		}
		
		$i = 0;
		$j = 0;

		if (mysql_num_rows($result) != 0)
		{
			$numrows = mysql_num_rows($result);

			echo("<div id=column>");
			echo("<table><tr><th>" . utf8_encode("M�ngd") . "</th><th>Vara</th></tr>");
			while ($row = mysql_fetch_row($result))
			{

				if ( $i % 2 )
					$background = " class='bg2' ";

				echo("<tr>");

				echo("<td" . $background . ">" . $row[2] . "</td>");
				echo("<td" . $background . "><a href='shoppingList.php?cmd=setAmount&row=" . $row[0] . "&id=" . $this->id . "&amount=" . $row[2] . "'>" . $row[1] . "</td>");
				
				

				if ($this->cmd != "print")
				{
					echo("<td><a href='shoppingList.php?cmd=remove&row=" . $row[0] . "&id= " . $this->id . "'>Ta bort</a></td>");
					
				}
				
				echo("</tr>\n");

				$i++;
				$j++;
				$background = "";

				if ($i == $maxrows )
				{
					echo("</table>");

					if ( !($numrows == $j) )
					{			
						echo("</div><div id=column>");
						echo("<table><tr><th>" . utf8_encode("M�ngd") . "</th><th>Vara</th></tr>");
						$i = 0;
					}
				}
			}
			echo("</table>");
			echo("</div>");
		}
	}

	function printList()
	{
		$this->showList();
	}

	function addListItem()
	{
		$query = "select id from ListItem where name = '" . $this->parser->parseInvalidCharacters($this->name) . "';";
		echo("Q1: " . $query . "<br>");
		$result = mysql_query($query);

		if (mysql_num_rows($result) != 0)
		{
			$row = mysql_fetch_row($result);
		}
		$query ="insert into ListRow (itemid, shoppinglistid) values(" . $row[0] . "," . $this->id . ");";
		echo("Q2: " . $query . "<br>");
		//exit();
		$result = mysql_query($query);
	}

	function removeListItem()
	{
		if ($this->row > 0)
		{
		$query = "delete from ListRow where id = " . $this->row . ";";
		$result = mysql_query($query);
		}
	}

	function setListItemAmount()
	{
		if ($_POST['count'] == "true")
		{
			$query = "update ListRow set amount = '" . $_POST['amount'] . "' where id = " . $this->row . ";";
			mysql_query($query);
			header("Location: shoppingList.php?cmd=show&id=" . $this->id);
			exit();
		}

		echo("<center>\n");
		echo("<div id='frame'>\n");
		$this->layout->showHeader();	
		$this->layout->showElector();

		?>
		<div id="center">
		<?
		echo(utf8_encode("<h1>S�tt v�rde</h1>"));
		
		$query = "select li.name from ListRow lr, ListItem li where lr.id = " . $this->row . " and li.id = lr.itemid;";
		$result = mysql_query($query);
		
		if (mysql_num_rows($result) != 0)
		{
			$row = mysql_fetch_row($result);
		?>
			<form action='shoppingList.php?cmd=setAmount&id=<?=$this->id?>&row=<?=$this->row?>' method='post'>
			<table>
				<tr>
					<td><?=$row[0]?></td><td><input name='amount' value='<?=$_GET['amount']?>' type='edit'><input type='submit' value='<?=utf8_encode('�ndra')?>'></td>
				</tr>
			</table>
			<input type='hidden' name='count' value='true'>
			</form>
		</div>
		<?
		}
		$this->layout->showAdPane();
		$this->layout->showFooter();
		echo("</div>\n");
		echo("</center>\n");
	}

	function moveRow()
	{
	}

	function clearList()
	{
		$query = "delete from ListRow where shoppinglistid = " . $this->id . ";";
		$result = mysql_query($query);
	}

	function populateList()
	{
		$this->clearList();
		$query = "select id from ListItem;";
		$result = mysql_query($query);

		if (mysql_num_rows($result) != 0)
		{
			while($row = mysql_fetch_row($result))
			{
				$query ="insert into ListRow (itemid,shoppinglistid) values(" . $row[0] . "," . $this->id . ");";
				mysql_query($query);
			}
		}
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
	$bookList = new BookList();
?>
