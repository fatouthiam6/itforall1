<?php
include "connection.php";



try {
    if (isset($_POST['email'], $_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];
    
        $req = $db->prepare("SELECT nom, prenom, telephone, email FROM utilisateur WHERE email=? AND password=?");
        $req->execute(array($email, $password));
        $exist = $req->rowCount();
        if ($exist == 1) {
            $array = $req->fetch(PDO::FETCH_ASSOC);
            $msg = "Connexion réussie";
            $success = 1;
            $data = array(
                "nom" => $array['nom'],
                "prenom" => $array['prenom'],
                "telephone" => $array['telephone'],
                "email" => $array['email']
            );
        } else {
            $msg = "L'email ou le mot de passe est incorrect";
            $success = 0;
            $data = null;
        }
    } else {
        $success = 0;
        $msg = "Erreur : données vides"; 
        $data = null;
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur : " . $th->getMessage();
    $data = null;
}

echo json_encode([
    "success" => $success,
    "msg" => $msg,
    "data" => $data
]);

?>
