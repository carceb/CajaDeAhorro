<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Afiliacion.aspx.cs" Inherits="CajaDeAhorro.Afiliacion" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>


<!DOCTYPE HTML>

<html>
	<head>
		<title>Caja de Ahorros | Afiliación</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<%--        SCRIPTS--%>

		<link rel="stylesheet"  href="../Styles/jquery-ui-1.8rc3.custom.css"  />
		<script src="../assets/js/jquery.min.js"></script>
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../Styles/simpleAutoComplete.css"  />
		<script src="../js/Util.js" type="text/javascript"></script>
<%--        <script src="../js/jquery.js"></script>--%>
		<script  src="../js/jquery-ui-1.8rc3.custom.min.js"></script>
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>      
<%--------------------------%>


	   <%----------------------------------------------------------------------------------------------------------------------------------------------%>
	   <%-- PROCESO PARA COMBOS ANIDADOS DESDE EL CLIENTE CON AJAX  JSON Y JAVASRCIPT--%>
		<%--COMBO ANIDADO 2--%>
		<script type = "text/javascript">
			var pageUrl = '<%=ResolveUrl("Afiliacion.aspx")%>'
			function CargarHijos() {
				$("#<%=ddlHijo.ClientID%>").attr("disabled", "disabled");
				$("#<%=ddlNieto.ClientID%>").attr("disabled", "disabled");
				if ($('#<%=ddlPadre.ClientID%>').val() == "0") {
					$('#<%=ddlHijo.ClientID %>').empty().append('<option selected="selected" value="0">Seleccione la marca del equipo</option>');
					$('#<%=ddlNieto.ClientID %>').empty().append('<option selected="selected" value="0">Seleccione el modelo del equipo</option>');
				}
				else {

					$('#<%=ddlHijo.ClientID %>').empty().append('<option selected="selected" value="0">Cargando...</option>');
					$.ajax({
						type: "POST",
						url: pageUrl + '/CargarHijo',
						data: '{padreID: ' + $('#<%=ddlPadre.ClientID%>').val() + '}',
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: EnMarcasCargadas,
						failure: function(response) {
							alert(response.d);
						}
					});
				}
			}
 
			function EnMarcasCargadas(response) {
				CargarControl(response.d, $("#<%=ddlHijo.ClientID %>"));
			}
		</script>
		<%----------------------------------------------------------------------------------------------------------------------------------------------%>

		<%--COMBO ANIDADO 3--%>
		<script type = "text/javascript">
			function CargarNieto() {
				$("#<%=ddlNieto.ClientID%>").attr("disabled", "disabled");
				if ($('#<%=ddlHijo.ClientID%>').val() == "0") {
					$('#<%=ddlNieto.ClientID %>').empty().append('<option selected="selected" value="0">Seleccione el modelo del equipo</option>');
				}
				else {
					$('#<%=ddlNieto.ClientID %>').empty().append('<option selected="selected" value="0">Cargando...</option>');
					$.ajax({
						type: "POST",
						url: pageUrl + '/CargarNieto',
						data: '{nietoID: ' + $('#<%=ddlHijo.ClientID%>').val() + '}',
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: EnModelosCargados,
						failure: function(response) {
							alert(response.d);
						}
					});
				}
			}
 
			function EnModelosCargados(response) {
				CargarControl(response.d, $("#<%=ddlNieto.ClientID %>"));
			}
		</script>
			<script type = "text/javascript">
			  function CargarControl(list, control) {
				if (list.length > 0) {
					control.removeAttr("disabled");
					control.empty().append('<option selected="selected" value="0">Por favor seleccione el municipio / parroquia</option>');
					$.each(list, function() {
						control.append($("<option></option>").val(this['Value']).html(this['Text']));
					});
				}
				else {
					control.empty().append('<option selected="selected" value="0">No disponible<option>');
				}
			}
		</script>
		<%--FIN DE COMBOS ANIDADOS--%>
		<%----------------------------------------------------------------------------------------------------------------------------------------------%>
	  
	</head>
	<body>
		<MsgBox:UCMessageBox ID="messageBox" runat="server" ></MsgBox:UCMessageBox>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- Header -->
								<header id="header">
									<a class="logo"><strong><asp:Label runat ="server" ID ="lblTitulo" Text="Datos de la Afiliación"></asp:Label></strong></a>
									<ul class="icons">
										<asp:Label runat ="server" ID ="lblTitulo2" Text="Datos de la Afiliación"></asp:Label>
									</ul>
								</header>
							<!-- Content -->
							<form runat ="server" id ="principal">
								<section>
									<p></p>
										<div class="row uniform">
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtCedula"   MaxLength="12" placeholder="Cédula afiliado" />
												<ASP:RequiredFieldValidator id="rqrvalidaRifOrganizacion" runat="server" errormessage="Debe colocar la cédula del afiliado" controltovalidate="txtCedula" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtNombreAfiliado"  MaxLength="80"  placeholder="Nombre afiliado" />
												<ASP:RequiredFieldValidator id="rqrvalidaNombre" runat="server" errormessage="Debe colocar el nombre del afilaido"  controltovalidate="txtNombreAfiliado" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlSexo" runat="server"  AppendDataBoundItems="True"  >
														<asp:ListItem>--Seleccione el sexo--</asp:ListItem>
                                                        <asp:ListItem>M</asp:ListItem>
														<asp:ListItem>F</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlPadre" runat="server" AppendDataBoundItems="true"
																 onchange = "CargarHijos();">
													</asp:DropDownList>
													<ASP:RequiredFieldValidator id="rqrvalidaEstado" runat="server" errormessage="Debe seleccionar el estado" controltovalidate="ddlPadre" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlHijo" runat="server"  onchange = "CargarNieto();">
                                                        <asp:ListItem>Municipio</asp:ListItem>
		   										    </asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlNieto" runat="server">
                                                        <asp:ListItem>Parroquia</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlTipoEmpleado" runat="server"  AppendDataBoundItems="True"  >
														<asp:ListItem>--Seleccione el tipo de empleado--</asp:ListItem>
                                                        <asp:ListItem>Fijo</asp:ListItem>
														<asp:ListItem>Contratado</asp:ListItem>
														<asp:ListItem>Jubilado</asp:ListItem>
														<asp:ListItem>Pensionado</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlGerencia" runat="server"  AppendDataBoundItems="True"  >
														<asp:ListItem>--Seleccione la unidad--</asp:ListItem>
                                                        <asp:ListItem>Informatica</asp:ListItem>
														<asp:ListItem>Administración</asp:ListItem>
														<asp:ListItem>Tesoreria</asp:ListItem>
														<asp:ListItem>Auditoria</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtTelefonoAfiliado"  MaxLength="100" placeholder ="Teléfono del afiliado" pattern="^([0-9]{11})$" title="Debe colocar el codigo seguido del numero sin espacios ni guiones 04127654321"/>
												<ASP:RequiredFieldValidator id="rqrValidaTelefonoOrg" runat="server" errormessage="Debe colocar el telefono de la organización" controltovalidate="txtTelefonoAfiliado" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtDireccionAfiliado"  MaxLength="300"  placeholder="Dirección del afiliado" TextMode="MultiLine" Rows="1" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" errormessage="Debe colocar la dirección del afilaido"  controltovalidate="txtDireccionAfiliado" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtCorreo"  MaxLength="100" placeholder ="Correo" pattern="[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+" title="Debe usar la estructura de correo electronico Ejemplo@alcaldia.es" />
												<ASP:RequiredFieldValidator id="rqrCorreo" runat="server" errormessage="Debe colocar el Correo"  controltovalidate="txtCorreo" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<asp:TextBox runat="server" ID="txtSueldoMensual"  MaxLength="20" placeholder ="Sueldo Mensual" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" errormessage="Debe colocar el sueldo" controltovalidate="txtSueldoMensual" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtPorcentaje"  MaxLength="3"  placeholder="% De de ahorro" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" errormessage="Debe indicar el porcentaje de ahorro"  controltovalidate="txtPorcentaje" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtFechaSolicitud"  MaxLength="30"  placeholder="Fecha de Solicitud" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" errormessage="Debe indicar Fecha de Solicitud"  controltovalidate="txtFechaSolicitud" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtFechaIngreso"  MaxLength="30"  placeholder="Fecha de Ingreso a la Caja de Ahorro" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" errormessage="Debe indicar Fecha de Ingreso a la Caja de Ahorro"  controltovalidate="txtFechaIngreso" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)"> 
												<asp:TextBox runat="server" ID="txtCuenta"  MaxLength="20"  placeholder="Cuenta Bancaria" />
												<ASP:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" errormessage="Debe indicar el numero de cuenta"  controltovalidate="txtCuenta" display="Dynamic" ForeColor ="Red"></ASP:RequiredFieldValidator>
											</div>
											<div class="6u 12u$(xsmall)">
												<div class="select-wrapper">
													<asp:DropDownList ID="ddlBanco" runat="server"  AppendDataBoundItems="True"  >
														<asp:ListItem>--Seleccione el banco--</asp:ListItem>
                                                        <asp:ListItem>Banesco</asp:ListItem>
														<asp:ListItem>Venezuela</asp:ListItem>
														<asp:ListItem>Mercantil</asp:ListItem>
														<asp:ListItem>Provincial</asp:ListItem>
														<asp:ListItem>Bicientenario</asp:ListItem>
													</asp:DropDownList>
												</div>
											</div>

											<div class="12u$">
												<ul class="actions">
													<li><asp:Button Text="Registrar afiliado" runat="server" ID ="btnGuardar"  CssClass ="special"  /></li>
                                                    <li><asp:ImageButton  CausesValidation ="false" runat="server" ImageUrl="~/images/imprimir.jpg"    OnClientClick="javascript:window.open('../images/PlanillaIngreso.png');"/>  </li>
											   </ul>
										  </div>
									</div>
								</section>
						   </form>
						</div>
					</div>                  
				<!-- Sidebar -->
<%--					<div id="sidebar">
						<div class="inner">--%>
							<!-- Menu -->
								<uc2:UCNavegacion  runat ="server" ID ="ControlMenu"/>
<%--						</div>
					</div>--%>
			</div>
	</body>
</html>
