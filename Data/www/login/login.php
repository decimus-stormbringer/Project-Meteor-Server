<?php
error_reporting(E_ALL | E_STRICT);

include("config.php");
include("database.php");

// Shared login logic
function LoginAttempt($username, $password, $databaseConnection)
{
    if (empty($username)) {
        throw new Exception("You must enter a username.");
    }

    if (empty($password)) {
        throw new Exception("You must enter a password.");
    }

    $userId = VerifyUser($databaseConnection, $username, $password);
    return RefreshOrCreateSession($databaseConnection, $userId);
}

$loginError = "";
$sessionId = "";
$username = "";
$password = "";

// --- Detect launcher type automatically ---
// Try Meteor first (JSON input)
try {
    $rawInput = file_get_contents("php://input");
    if (!empty($rawInput)) {
        $decoded = json_decode($rawInput, false);
        if (isset($decoded->authentication)) {
            // Meteor launcher
            $authcode = $decoded->authentication;
            $login_data = json_decode(base64_decode($authcode), false);
            if (isset($login_data->username) && isset($login_data->password)) {
                $username = $login_data->username;
                $password = $login_data->password;
                $sessionId = LoginAttempt($username, $password, $g_databaseConnection);
                echo("sessionId=" . $sessionId);
                exit;
            }
        }
    }
} catch (Exception $e) {
    // If Meteor format fails, continue to 7th Umbral handling
    $loginError = $e->getMessage();
}

// --- 7th Umbral Web UI fallback ---
if (isset($_POST["login"])) {
    try {
        $username = trim($_POST["username"]);
        $password = trim($_POST["password"]);
        $sessionId = LoginAttempt($username, $password, $g_databaseConnection);
    } catch (Exception $e) {
        $loginError = $e->getMessage();
    }
}
?>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>FFXIV 1.0 Login</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css" />    
        <link rel="stylesheet" type="text/css" href="css/global.css" />    
    </head>
    <body>
        <?php
            if (!empty($sessionId)) {
                echo "<script>window.location=\"ffxiv://login_success?sessionId=" . $sessionId . "\";</script>";
            }
        ?>
        <div style="width: 80%; height: 300px; margin-left: auto; margin-right: auto; margin-top: 20%">
            <div class="contentContainer">
                <img style="width: 775px; height: 537.95px; margin-top: -50%; margin-left: -40%" src="./img/logo_new.png" />
            </div>
            <div class="contentContainer">
                <div class="info">
                    <br />
                    <form method="post" autocomplete="off">
                        <label>Username:</label><br />
                        <input type="text" name="username" /><br />
                        <label>Password:</label><br />
                        <input type="password" name="password" /><br /><br />
                        <input type="submit" name="login" value="Login" />
                    </form>
                    <?php
                        if (!empty($loginError)) {
                            echo "<div style='color:red; margin-top:10px;'>" . htmlspecialchars($loginError) . "</div>";
                        }
                </div>
            </div>
        </div>
    </body>
</html>