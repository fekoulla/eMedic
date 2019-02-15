<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">

        <title>eMedic</title>

        <!-- Image and text -->
        <nav class="navbar navbar-light bg-light" style="background-color: rgb(248, 248, 248)">
            <a class="navbar-brand" href="#">
                <img src="logo.png" width="70" height="40" class="d-inline-block align-top" alt="">
                &ensp; eMedic
            </a>
        </nav>

    </head>
    <body style="background-color: rgb(238, 238, 238">

        <div class="container">
            <div class="row">
                <div class="col">
                </div>
                <div class="col" style="margin-top: 50px;">
                    <h3 class="text-center"><strong>eMedic, la solution intelligente de médecine. </strong></h3>
                </div>
                <div class="col">
                </div>
            </div>
        </div>

        <div class="container">
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col" style="margin-top: 50px;">
                        <p id ="affichage" class="text-center"></p>
                    </div>
                    <div class="col">
                    </div>
                </div>
        </div>

        <div class="container">
                <div class="row">
                    <div class="col" style="margin-top: 300px; margin-left: 200px;">
                        <div class="input-group mb-3">
                            <form action="ajax.js" method="get">
                                <input type="text" class="form-control" name="message" placeholder="Saisissez vos informations" aria-label="informations" ><br>
                                <button id="submit" type="submit" onclick="myFunction()">Envoyer</button>
                            </form>                      
                        </div>
                    </div>
                </div>
            </div>
        
        <footer>
            <div class="container">
            <p>&copy; All Rights Reserved. Alrosef</p>
            </div>
        </footer>

    <!-- Optional JavaScript -->
    <script>
            function myFunction() {
              var afficher = document.getElementsByName("saisie");
              document.getElementById("affichage").innerHTML = afficher;
            }
    </script>



    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js" integrity="sha384-7aThvCh9TypR7fIc2HV4O/nFMVCBwyIUKL8XCtKE+8xgCgl/PQGuFsvShjr74PBp" crossorigin="anonymous"></script>
  </body>
</html>






