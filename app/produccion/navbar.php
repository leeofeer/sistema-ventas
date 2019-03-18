	<?php
		if (isset($title))
		{
	?>
<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Opciones</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">El Bunker</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="<?php echo $active_ordenes;?>"><a target="_blank" href="index.php"> Ordenes <span class="sr-only">(current)</span></a></li>
        <li class="<?php echo $active_produccion;?>"><a target="_blank" href="facturas.php">Produccion <span class="sr-only">(current)</span></a></li>
        <li class="<?php echo $active_productos;?>"><a target="_blank" href="cobros.php">Productos </a></li>
        <li class="<?php echo $active_recetas;?>"><a target="_blank" href="productos.php"> Recetas</a></li>
        <li class="<?php echo $active_control;?>"><a target="_blank" href="apertura.php">Control Produccion</a></li>
		<li class="<?php echo $active_mermas;?>"><a target="_blank" href="clientes.php">Mermas</a></li>
		<!--<li class="<?php// echo $active_usuarios;?>"><a target="_blank" href="usuarios.php">Usuarios</a></li> -->
		
      </ul>

      <ul class="nav navbar-nav navbar-right" style="">
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Account
                   <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="width: 230px;">
                      <li>

                        <div class="navbar-content">
                            <div class="row">
                                <div class="col-md-10">
                                    <span> <?php echo $usuario_logueado?></span>

                                    <div class="divider">
                                    </div>
                                    <p><span id="user_nivel"><?php echo $_SESSION['nivel']?></span></p>
                                    <div class="divider">
                                    </div>

                                    <p><span>SUCURSAL: <label id="idsucursal">
                                      <?php if(isset($_SESSION['idsucursal'])){
                                       echo $_SESSION['idsucursal'];}?>
                                    </label></span></p>

                                    <div class="divider">
                                    </div>
                    
                                </div>
                            </div>

                          <div class="navbar-footer">
                            <div class="row">
                              <div class="col-md-6">
                                <a href="#" class="btn btn-primary btn-xs">Cambiar Contraseña</a>
                              </div>
                              <div class="col-md-6">
                                <a href="login.php?logout" class="btn btn-alert btn-xs pull-right">Cerrar Sesion</a>
                              </div>
                            </div>
                          </div>

                      </li>
                  </ul>
              </li>
           </ul>
        </div>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<?php
		}
	?>