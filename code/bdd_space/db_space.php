<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "db_space";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM planete";
    $result = $conn->query($sql);
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données : " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des planètes</title>
    <link rel="stylesheet" href="script.css">
</head>
<body>
    <h1>Liste des planètes</h1>

    <?php
    if ($result->rowCount() > 0) {
        // Afficher les données dans une liste
        echo "<ul>";
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            echo "<li>Nom : " . htmlspecialchars($row["nom_planete"]) . "<br>
                  Superficie : " . $row["superficie"] . "<br>
                  Masse : " . $row["masse"] . "<br>
                  Type : " . htmlspecialchars($row["type"]) . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>Aucune planète trouvée.</p>";
    }
    ?>
</body>
</html>
