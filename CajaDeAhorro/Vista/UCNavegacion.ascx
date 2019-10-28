<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCNavegacion.ascx.cs" Inherits="CajaDeAhorro.Vista.UCNavegacion" %>

<!DOCTYPE HTML>

<html>

	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->


							<!-- Menu -->
							
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="Principal.aspx">Inicio</a></li>
										<li>
											<span class="opener">Afiliación</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkAfiliacion"  navigateurl ="~/Vista/Afiliacion.aspx"  Text ="Registrar afiliación"></ASP:HyperLink></li>
												<li><ASP:HyperLink runat="server" ID ="lnkAfiliados"  navigateurl ="~/Vista/ConsultarAfiliados.aspx"  Text ="Consultar afiliados"></ASP:HyperLink></li>
											</ul>
										</li>

										<li>
											<span class="opener">Caja de Ahorros</span>
												<ul>
													<li><ASP:HyperLink runat="server" ID ="lnkCuentas"  navigateurl ="~/Vista/RegistrarCuentas"  Text ="Registrar cuentas"></ASP:HyperLink></li>
													<li><ASP:HyperLink runat="server" ID ="lnkIngresos"  navigateurl ="~/Vista/IngresarRecursosEnCuentas"  Text ="Ingresar recursos en cuentas"></ASP:HyperLink></li>
													<li><ASP:HyperLink runat="server" ID ="lnkReversar"  navigateurl ="~/Vista/ReversarIngresos.aspx"  Text ="Reversar ingreso de recursos"></ASP:HyperLink></li>
                                                    <li><ASP:HyperLink runat="server" ID ="lnkPrestamos"  navigateurl ="~/Vista/Prestamos.aspx"  Text ="Prestamos"></ASP:HyperLink></li>
                                                    <li><ASP:HyperLink runat="server" ID ="lnkConcilaicion"  navigateurl ="~/Vista/Conciliacion.aspx"  Text ="Conciliación bancaria"></ASP:HyperLink></li>
													<li><ASP:HyperLink runat="server" ID ="lnkAsignarMontosAfiliado"  navigateurl ="~/Vista/IngresarMontosAfiliados"  Text ="Ingresar montos a afiliados"></ASP:HyperLink></li>
												</ul>
										</li>

										<li>
											<span class="opener">Opciones especiales</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkBancos"  navigateurl ="~/Vista/Bancos.aspx" Text ="Registrar bancos"></ASP:HyperLink></li>
											</ul>
										</li>
										<li>
											<span class="opener">Estadísticas</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkIngresoRecursos"  navigateurl ="~/Vista/ConsultarIngresoRecursos.aspx"  Text ="Ingreso de recursos"></ASP:HyperLink></li>												
												<li><ASP:HyperLink runat="server" ID ="lnkEgresoRecursos"  navigateurl ="~/Vista/ConsultarEgresoRecursos.aspx"  Text ="Egreso de recursos"></ASP:HyperLink></li>
											</ul>
										</li>
										<li>
											<span class="opener">Seguridad</span>
											<ul>
												<li><ASP:HyperLink runat="server" ID ="lnkSeguridad"  navigateurl="~/Vista/Seguridad.aspx" Text ="Agregar / Modificar Usuario"></ASP:HyperLink></li>
												<li><ASP:HyperLink runat="server" ID ="lnkCambiarClave"  navigateurl="~/Vista/SeguridadCambiarClave.aspx" Text ="Cambiar Clave"></ASP:HyperLink></li>
											</ul>
										</li>
										<li><a href="Logout.aspx">Salir</a></li>
									</ul>
								</nav>
								
							<!-- Section -->


							<!-- Section -->
							<!-- Footer -->
								<footer id="footer">
									<p><%:Session["NombreCompletoUsuario"]%> <%:Session["NombreEmpresa"]%></p>
									<p class="copyright">&copy; <%= DateTime.Now.ToString("yyy") %> Desarrollado por Carlos Ceballos C.A.</p>
								</footer>
						</div>
					</div>
			</div>
		<!-- Scripts -->
	</body>
</html>