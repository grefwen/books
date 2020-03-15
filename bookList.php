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

		$this->db = new dbConnect();
		$this->db = $this->db->handle;
		$this->table = "BookList";
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
        if (isset($_GET['id']))
            $this->id = trim($_GET['id']);
        if (isset($_GET['cmd']))
            $this->cmd = $_GET['cmd'];
        if (isset($_GET['row']))
            $this->row = $_GET['row'];
    }

        // Parse Post -------------------------------------------------------------
    function parsePOST()
    {
        if ($this->id == "" && isset($_POST['authorID']))
        {
        	$this->id = $_POST['authorID'];
        }
    }

	// Cofacturer -----------------------------------------------
	function cmdCreate($edit)
	{

	}

	// Command: Delete manufacturer -----------------------------------------------
	function cmdDestroy()
	{

	}

        // Command: Show manufacturer -------------------------------------------------
    function cmdShow($cmd)
    {
        $query = "";
        $h1 = "";
        
        switch ($cmd) {
            case "author":
                {
                    $query = "select name, surname from Author where authorid = " . $this->id . ";";
                    $result = $this->db->query($query);
                    
                    if (isset($result->num_rows) && $result->num_rows != 0) {
                        $row = $result->fetch_row();
                        $auth = $row[0];
                        if (trim($row[1]) != "") {
                            $auth .= " ";
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
        $result = $this->db->query($query);
        $id = "";
        if (isset($result->num_rows) && $result->num_rows != 0) {
            $i = 0;
            while ($row = $result->fetch_row()) {
                if ($i ++ == 0) {
                    $id = $row[0];
                } else {
                    $id .= "," . $row[0];
                }
            }
        }

        $this->showMenu();
        
        $query = "select b.title, r.name, l.bookshelf, l.shelf, o.name, o.surname, b.edition, s.name, bt.name, b.bookID 
from Book b
left join Location l on l.locationID = b.locationID
left join Room r on r.roomID = l.roomID
left join Owner o on b.ownerID = o.ownerID
left join Status s on s.statusID = b.statusID
left join BindingType bt on bt.bindingTypeID = b.bindingTypeID 

where b.bookID in (" . $id . ") 
order by b.title asc, b.edition asc;";
         //echo("Q: " . $query . "<br>");
        $result = $this->db->query($query);
        if (isset($result->num_rows) && $result->num_rows != 0) {
            echo ("<h1>" . $h1 . " (" . $result->num_rows);
            if ($result->num_rows == 1)
                echo (" bok)");
            else
                echo (" böcker)");
            echo ("</h1>");
            
            echo ("<table><tr><th>Titel</th><th>Utgåva</th><th>Bindning</th><th>Rum</th><th>Bokhylla</th><th>Hyllplan</th></tr>\n");
            $i = 0;
            
            while ($row = $result->fetch_row()) {
                $title = $row[0];
                $room = $row[1];
                $bookCase = $row[2];
                if ($bookCase == "0")
                	$bookCase = "";
                $shelf = $row[3];
                if ($shelf == "0")
                	$shelf = "";
                $owner = $row[4];
                if (trim($row[5]) != "") {
                    $owner .= " ";
                    $owner .= $row[5];
                }
                $edition = $row[6];
                $status = $row[7];
                $back = $row[8];
                $id = $row[9];
                
                if (! ($i % 2))
                    $bgcolor = " class='bg2'";
                else
                    $bgcolor = "";
                
                echo ("<tr" . $bgcolor . ">\n
						<td><a href='book.php?cmd=show&id=" . $id . "'>" . $title . "</a></td>\n
						<td class='center'> " . $edition . "</td>\n
						<td nowrap>" . $back . "</td>\n
						<td>" . $room . "</td>\n
						<td class='center'>" . $bookCase . "</td>\n
						<td class='center'>" . $shelf . "</td>\n

					</tr>\n");
                
                $i ++;
            }
            echo ("</table>\n");
        }
        
        ?>
		</div>
<?

        echo ("</div>\n");
        echo ("</center>\n");
    }
	function getOptions($id)
	{
		$selected = "";
		echo ("<SELECT class='select' name='" . lcfirst ( $id ) . "ID'>\n");
		if (trim ( $id ) == "")
		{
			$selected = "selected ";
		}
		echo ("\t<OPTION " . $selected . ">null</OPTION>\n");
		$selected = "";
		
		if ($id == "Author")
			$query = "SELECT concat (Surname, ', ', Name), " . $id . "ID from " . $id . " order by Surname asc;";
		
		// echo ("Options: " . $query);
		$result = $this->db->query ( $query );
		if ($result->num_rows != 0)
		{
			while ( $row = $result->fetch_row () )
			{
				if ($id == $row [1])
					$selected = "selected ";
				echo ("\t<OPTION " . $selected . "value=" . $row [1] . ">" . $row [0] . "</OPTION>\n");
				$selected = "";
			}
		}
		echo ("</SELECT>\n");
	}

	// Command: Edit manufacturer -------------------------------------------------
	function cmdEdit()
	{

	}

	// Insert a new manufacturer into the database --------------------------------
	function dbInsert($edit)
	{

	}

	function dbDelete()
	{

	}

	function setHeader()
	{
			echo("\t<title>Häpp" );
			echo("</title>\n");
	}

	function showMenu()
	{
		?>
<form action='bookList.php?cmd=showAuthor' method='post'>
<table>
	<tr><td><a href='bookList.php?cmd=show'>[ Visa alla böcker ] </a></td>
		<td> [ Visa författare: <?= $this->getOptions("Author") ?> <input type='submit' value='Sök'> ] </td>
		<td> [ <a href='book.php?cmd=create'>Lägg till bok ]</a>
	</tr>
</table>
</form>
<?php 
	}
}

	echo("\r<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n<html>\n<head>\n"); 
	echo("\t<link rel='stylesheet' href='css/backstedt.css' type='text/css'>\n");
	echo("\t<link rel='stylesheet' href='css/print.css' type='text/css' media='print'>\n");
	echo("\t<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>\n");
	//new dbConnect();
	$bookList = new BookList();
?>
