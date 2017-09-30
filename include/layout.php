<?
class Layout
{
	function Layout()
	{
	}

	function showHeader() // ---------------------------------------------------------------------------------------
	{
		echo("<div id='header'>\n");
        // Logo and shit should go in here.
        echo("Bäckstedt's (temporary) Stuff\n");
        //echo("hello world\n");
		echo("</div>\n");
	}

	function showFooter() // ---------------------------------------------------------------------------------------
	{
		echo("<div id='footer'>\n");
        // Disclaimers and stuff should be here.'
        echo("This page is under construction and should by no means be confused with the real thing. So there!\n");
        echo("</div>\n");
	}

	function showElector() // --------------------------------------------------------------------------------------
	{
		echo("<div id='leftcol'>\n");
		$base = $_SERVER['SERVER_NAME'];
		//echo("BASE: " . $base . "<br>");
		//exit();
        //require("elector.php");

//	require_once("include/LoginSession.php");
//	$theLoginSession = new LoginSession;

//	if ($theLoginSession->validate()) // är användaren inloggad?
	{ 
?>
<div id='menu'>
<div id='menuheader'>Menu</div>
<ul>
<li><a href='songbook/index.php' target="_new">Onlinesångbok</a>
<li><a href='chile.php'>Chilepeppar</a>
<li><a href='apk.php'>APK-lista</a>
<li><a href='photo.php'>Fotoarkiv</a>
<li><a href='pwratio.php'>Bilfakta</a>
<li><a href='pubList.html'>Publist</a>
<li><a href='videoList.php'>Filmlista</a>
</ul>
</div>

<div id='menu'>
<div id='menuheader'>Logged in</div>
<form action="logout.php" method="post" target="_top">
Username:
<br>
<span><?=$_COOKIE[LastLoginName]?></span><br><br>
<input type="submit" value="Log out">
</form>
</div>

<?
	}
//	else // om användaren inte är inloggad.
	{ ?>

<div id='menu'>
<div id='menuheader'>Log in</div>
<form action="login.php" method="post" target="_top">
Username:
<br>
<input class='menuinput' type="text" name="Username" value="<? if (isset($_COOKIE['LastLoginName'])) echo $_COOKIE['LastLoginName']?>">
<br>
Password:
<br>
<input class='menuinput' type="password" name="Password">
<br>
<input type="submit" value="Log in">
</form>
</div>

<div id='menu'>
<div id='menuheader'>Menu</div>
<ul>
<li><a href='http://<?=$base?>/backstedt/books/bookList.php'>Books</a>
<li><a href='http://<?=$base?>/backstedt/shopping/shoppingList.php'>Shopping</a>
<li><a href='http://<?=$base?>/backstedt/pubs.php'>Publist</a>
<li><a href='http://<?=$base?>/backstedt/ilandsproblem.php'>I-landsproblem</a>
<li><a href='http://<?=$base?>/backstedt/map_dublin.php'>Dublin Partymap</a>
<li><a href='http://<?=$base?>/backstedt/map_frankfurt.php'>Frankfurt Partymap</a>
</ul>
</div>
<?	} 
        // Menus and stuff go here.

		echo("</div>\n");
	}

	function showAdPane() // ---------------------------------------------------------------------------------------
	{/*
?>
		<div id='rightcol'>
            <div id='menu'>
               <div id='menuheader'>The Blog</div>
               <ul>
                  <li><a href='blog.php'>February</a>
               </ul>
            </div>
		</div>
<?	*/}

	function showMain() // -----------------------------------------------------------------------------------------
	{
        // This should not be used.
	}
}
?>
