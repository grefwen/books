<?
//require_once("../include/LoginSession.php");
//require_once("../include/textParsing.php");
//require_once("common.php");
require_once("include/layout.php");
require_once("include/db_connect.php");

class Book
{
	var $id;
	var $db;
	var $query;
	var $layout;
	var $cmd;
	var $transaction;

	// Constructor ------------------------------------------------------------
	function Book()
	{
		$this->parseGET();
		$this->parsePOST();
		
		if ($this->cmd == "")
			$this->cmd = "show";

		$this->table = "Book";
		$this->db = new dbConnect ();
		$this->db = $this->db->handle;
		$this->layout = new Layout();
		
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
			default:
				echo("<span class='error'>Command does not exist. Exiting.</span>");
				exit();
		}
	}

        // Parse Querystring ------------------------------------------------------
    function parseGET()
    {   if (isset($_GET['id']))
	        $this->id = trim($_GET['id']);
        $this->cmd = $_GET['cmd'];
    }

        // Parse Post -------------------------------------------------------------
    function parsePOST()
    {
        if (isset($_POST['transaction']))
            $this->transaction = $_POST['transaction'];
    }

	// Command: Create manufacturer -----------------------------------------------
	function cmdCreate()
	{
		if ($this->transaction == "")
			$this->showEntryForm();
		elseif ($this->transaction == "createBook")
		{
			$title = trim ( $_POST ['title'] );
			if (trim ( $_POST ['title'] ) == "")
				$title = "null";
			else
			{	
				$title = preg_replace("/'/", "\'", trim ( $_POST ['title'] ));
				$title = "'" . $title . "'";
			}
			if (trim ( $_POST ['orgTitle'] ) == "")
				$orgTitle = "null";
			else
				$orgTitle = preg_replace("/'/", "\'", trim ( $_POST ['orgTitle'] ));
				$orgTitle = "'" . $orgTitle . "'";
			if (trim ( $_POST ['isbn'] ) == "")
				$isbn = "null";
			else
				$isbn = "'" . trim ( $_POST ['isbn'] . "'" );
			if (trim ( $_POST ['edition'] ) == "")
				$edition = "null";
			else
				$edition = trim ( $_POST ['edition'] );;
			$owner = $_POST ['ownerID'];
			$language = $_POST ['languageID'];
			$category = $_POST ['categoryID'];
			$publisher = $_POST ['publisherID'];
			$status = $_POST ['statusID'];
			$binding = $_POST ['bindingTypeID'];				
				
			if ($title != "")
			{
				$query = "select loc.locationID from Location loc
							where loc.roomID = " . $_POST ['roomID'] . "
							and loc.bookshelf = " . $_POST ['bookCase'] . "
							and loc.shelf = " . $_POST ['shelf'] . ";";
				echo ($query);
				$result = $this->db->query ( $query );
				if (isset ( $result->num_rows ) && $result->num_rows != 0)
				{
					$row = $result->fetch_row();
					$location = $row [0];
				} else
				{
					$location = "17";
				}
				
				$query = "insert into Book (title,originalTitle,edition,isbn,locationID,ownerID,languageID,categoryID,publisherID,statusID,bindingTypeID)
											values($title,$orgTitle,$edition,$isbn,$location,$owner,$language,$category,$publisher,$status,$binding);";
				echo ($query);
				if ($this->db->query ( $query ))
				{
					$bookID = $this->db->insert_id;
					$author = trim ( $_POST ['authorID'] );
					
					if ( $author != "")
					{
						$query = "insert into AuthorMap (bookID,authorID) values($bookID,$author);";
						echo ($query);
						$result = $this->db->query ( $query );
					}
					
				} else
				{
					echo ("fail");
				}
				
			}
			header ( "Location: book.php?id=" . $bookID . "&cmd=show" );
			//exit();
		}
		else {
			header ( "Location: bookList.php?cmd=show" );
		}	
		exit ();
	}

	// Command: Delete manufacturer -----------------------------------------------
	function cmdDestroy()
	{

	}
		
		// Command: Show manufacturer -------------------------------------------------
	function cmdShow()
	{
		echo("<center>\n");
		?>
		<div id="center">
		<?
		$query = "
SELECT 
 b.title, b.originalTitle, b.edition, b.isbn, b.published, b.originalpublished,
 l.name,
 o.name, o.surname,
 s.name,
 bt.name,
 r.name,
 loc.bookshelf, loc.shelf,
 c.name,
 p.name
FROM Book b
 LEFT JOIN Language l 		ON b.languageID 	= l.languageID
 LEFT JOIN Owner o 			ON b.ownerID 		= o.ownerID
 LEFT JOIN Status s 		ON b.statusID 		= s.statusID
 LEFT JOIN BindingType bt 	ON b.bindingTypeID 	= bt.bindingTypeID
 LEFT JOIN Category c 		ON b.categoryID 	= c.categoryID
 LEFT JOIN Publisher p 		ON b.publisherID 	= p.publisherID
 LEFT JOIN Location loc 	ON b.locationID 	= loc.locationID
 LEFT JOIN Room r 			ON loc.roomID 		= r.roomID
WHERE b.bookid = " . $this->id . ";
";
		
		$result = $this->db->query ( $query );
		
		if (isset($result->num_rows) && $result->num_rows != 0)
		{
			
			$row = $result->fetch_row ();
			
			$title = $row [0];
			$originalTitle = $row [1];
			if (trim ( $originalTitle ) == "")
				$originalTitle = $title;
			
			$edition = $row [2];
			$isbn = $row [3];
			$language = $row [6];
			$owner = $row [7];
			if (trim ( $row [7] ) != "")
			{
				$owner .= " ";
				$owner .= $row [8];
			}
			$status = $row [9];
			$back = $row [10];
			$room = $row [11];
			$bookCase = $row [12];
			$shelf = $row [13];
			$category = $row [14];
			$publisher = $row [15];
			$published = "";
			if (trim ( $row [4] ))
			{
				$published = date_create ( $row [4] );
				$published = $published->format ( "Y" );
			}
			$origPublished = "";
			if (trim ( $row [5] ))
			{
				$origPublished = date_create ( $row [5] );
				$origPublished = $origPublished->format ( "Y" );
			}
			
			$author [] = "";
			
			$query = "select a.name, a.surname, a.authorID from Author a, AuthorMap am, Book b where am.authorID = a.authorID and am.bookID = b.bookID and b.bookID = " . $this->id . " order by a.surname asc;";
			
			$result = $this->db->query ( $query );
			
			if ($result->num_rows != 0)
			{
				while ( $row = $result->fetch_row () )
				{
					$temp = $row [0];
					if (trim ( $row [1] ))
					{
						$temp .= " ";
						$temp .= $row [1];
						$temp = "<a href='bookList.php?cmd=showAuthor&id=" . $row [2] . "'>" . $temp . "</a>";
					}
					$authors [] = $temp;
				}
				$authors = implode ( ", ", $authors );
			}
			echo ("<h1>" . $title . "</h1>\n");
			echo ("<table>\n");
			echo ("<tr><th class='property'>Språk</th><td>" . $language . "</td></tr>\n");
			echo ("<tr><th class='property'>Förlag</th><td>" . $publisher . "</td></tr>\n");
			
			if ($title != $originalTitle)
			{
				echo ("<tr><th class='property'>Originaltitel</th><td>" . $originalTitle . "</td></tr>\n");
			}
			
			echo ("<tr><th class='property'>Utgåva</th>			<td>" . $edition . "</td></tr>\n");
			if ($published)
				echo ("<tr><th class='property'>Utgiven</th><td>" . $published . "</td></tr>\n");
			if ($published != $origPublished)
				echo ("<tr><th class='property'>Originalutgåva</th><td>" . $origPublished . "</td></tr>\n");
			
			echo ("<tr><th class='property'>Kategori</th>								<td>" . $category . "</td></tr>\n
					<tr><th class='property'>ISBN</th>									
					<td>");
			if (trim ( $isbn ) != "")
				echo ($isbn . ", [ <a href='https://libris.kb.se/hitlist?p=1&q=" . $isbn . "&t=v&d=libris&s=r&t=v&m=10&f=simp&spell=true'>Libris</a>, 
					<a href='https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=" . $isbn . "'>Amazon</a> ]</td></tr>\n");
			if (! isset ( $authors ))
				$authors = "";
			echo ("<tr><th valign='top' class='property'>Författare</th>		<td> " . $authors . "</td></tr>\n");
			echo ("<tr><th class='property'>Bindning</th>								<td>" . $back . "</td></tr>\n
					<tr><th class='property'>Rum</th>									<td>" . $room . "</td></tr>\n
					<tr><th class='property'>Bokhylla</th>								<td>" . $bookCase . "</td></tr>\n
					<tr><th class='property'>Hyllplan</th>								<td>" . $shelf . "</td></tr>\n
					<tr><th class='property'>Ägare</th>			<td>" . $owner . "</td></tr>\n
					<tr><th class='property'>Status</th>									<td>" . $status . "</td></tr>\n");
			echo ("</table>\n");
		}
		
		echo ("<a href='bookList.php?cmd=show'>Tillbaka</a>");
		?>
		</div>
		<?
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

	}

	function dbDelete()
	{
		$query = ";";
		mysql_query($query);
	}


	function setHeader()
	{
			echo("\t<title>Häpp");

			echo("</title>\n");
	}

	function showEntryForm()
	{
		?>
<form action='book.php?cmd=create' method='post'>
<table>
	<tr>
		<td>Titel</td><td><input name='title' type='edit'></td>
	</tr>
	<tr>
		<td>Originaltitel</td><td><input name='orgTitle' type='edit'></td>
	</tr>
		<tr>
		<td>Språk</td><td><?= $this->getOptions("Language")?></td>
	</tr>
		<tr>
		<td>Förlag</td><td><?= $this->getOptions("Publisher")?></td>
	</tr>	
	<tr>
		<td>Utgåva</td><td><input name='edition' type='edit'></td>
	</tr>	
			<tr>
		<td>Kategori</td><td><?= $this->getOptions("Category")?></td>
	</tr>
			<tr>
		<td>ISBN</td><td><input name='isbn' type='edit'></td>
	</tr>
			<tr>
		<td>Författare</td><td><?= $this->getOptions("Author")?></td>
	</tr>	
			<tr>
		<td>Bindning</td><td><?= $this->getOptions("BindingType")?></td>
	</tr>	
			<tr>
		<td>Rum</td><td><?= $this->getOptions("Room")?></td>
	</tr>	
		<tr>
		<td>Bokhylla</td><td><input name='bookCase' type='edit'></td>
	</tr>
		<tr>
		<td>Hyllplan</td><td><input name='shelf' type='edit'></td>
	</tr>
				<tr>
		<td>Ägare</td><td><?= $this->getOptions("Owner")?></td>
	</tr>
				<tr>
		<td>Status</td><td><?= $this->getOptions("Status")?></td>
	</tr>
	<tr>
		<td><input type='submit' value='Skapa'></td><td></td>
	</tr>
</table>
<input type='hidden' name='transaction' value='createBook'>
</form>
		<?
	}
	
	function getOptions($id)
	{
		$selected = "";
		echo ("<SELECT class='select' name='" . lcfirst($id) . "ID'>\n");
		if (trim($id) == "")
		{
			$selected = "selected ";
		}
		echo ("\t<OPTION " . $selected . ">null</OPTION>\n");
		$selected = "";
		
		if ($id == "Author" || $id == "Owner")
			$query = "SELECT concat (Name, ' ', Surname), " . $id . "ID from " . $id . " order by Surname asc;";
		else 
			$query = "SELECT Name, " . $id . "ID from " . $id . " order by Name asc;";
		
		//echo ("Options: " . $query);
		$result = $this->db->query ( $query );
		if ($result->num_rows != 0)
		{
			while ( $row = $result->fetch_row () )
			{
				if ($id == $row[1])
					$selected = "selected ";
					echo ("\t<OPTION " . $selected . "value=" . $row [1] . ">" . $row [0] . "</OPTION>\n");
					$selected = "";
			}
		}
		echo ("</SELECT>\n");
	}

}

	echo("\r<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n<html>\n<head>\n"); 
	echo("\t<link rel='stylesheet' href='css/backstedt.css' type='text/css'>\n");
	echo("\t<link rel='stylesheet' href='css/print.css' type='text/css' media='print'>\n");
	echo("\t<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>\n");
	$book = new Book();
?>
