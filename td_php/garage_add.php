<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Ajouter un garage</title>
</head>
<body>

<h1>Ajout d'un garage</h1>

<form method="POST" action="gform.php">
    <label for="name">Nom du garage</label>
    <input id="name" name="name" />

    <label for="city">Ville</label>
    <input id="city" name="city" />

     <label for="turnover">Chiffre d'affaire</label>
     <input id="turnover" name="turnover" type="number"/>

     <label for="creation">Date de création</label>
     <input id="creation" name="creation" type="date"/>

    <button type="submit">Envoyer</button>
 </form>

</body>
</html>