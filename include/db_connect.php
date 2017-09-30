<?
	class dbConnect
	{
		var $handle;
		function dbConnect()
		{
			$this->handle = mysqli_connect("localhost","root","olloncocktail","books");
			$this->handle->query("set names utf8;",MYSQLI_STORE_RESULT);
		}
	}

?>
