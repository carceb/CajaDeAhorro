<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultarAfiliados.aspx.cs" Inherits="CajaDeAhorro.ConsultarAfiliados" %>
<%@ Register TagPrefix="uc2" TagName="UCNavegacion" Src="~/Vista/UCNavegacion.ascx" %>
<%@ Register TagPrefix="MsgBox" Src="~/Vista/UCMessageBox.ascx" TagName="UCMessageBox" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Caja de Ahorros | Consultar Solicitudes Afiliados</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<%--        SCRIPTS--%>
		<link rel="stylesheet"  href="../Styles/jquery-ui-1.8rc3.custom.css"  />

		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../Styles/simpleAutoComplete.css"  />
		<script src="../js/Util.js" type="text/javascript"></script>
<%--        <script src="../js/jquery.js"></script>--%>      

		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>      


<%--------------------------%>

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
									<a class="logo"><strong>Consultar Afiliados</strong></a>
								</header>

							<!-- Content -->
							<form runat ="server" id ="principal">	
								<section>
										<p></p>
   
											<div class="table-wrapper">
												  <asp:GridView ID="gridDetalle" runat="server" 
													  CssClass="subtitulo" 
													  EmptyDataText="No existen Registros" 
													  GridLines="Horizontal" 
													  AutoGenerateColumns="False">
														<HeaderStyle  Font-Size="10px" />
														<AlternatingRowStyle Font-Size="10px" />
														  <RowStyle  Font-Size="10px" />
													  <Columns>
														  <asp:TemplateField HeaderText="Cedula" HeaderStyle-Width="50">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblCedula" Text='<%# Eval("CedulaAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Nombre" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblNombre" Text='<%# Eval("NombreAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Sexo" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblSexo" Text='<%# Eval("SexoAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Estado" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblEstado" Text='<%# Eval("NombreEstado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Municipio" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblNombreMunicipio" Text='<%# Eval("NombreMunicipio") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Parroquia" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblNombreParroquia" Text='<%# Eval("NombreParroquia") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Telefono">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblTelefono" Text='<%# Eval("TelefonoAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Dirección" >
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblDireccion" Text='<%# Eval("DireccionAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="Correo">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblEmail" Text='<%# Eval("EmailAfiliado") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
														  <asp:TemplateField HeaderText="% de Ahorro">
															  <ItemTemplate>
																  <asp:Label runat="server" ID="lblPorcentajeAhorro" Text='<%# Eval("PorcentajeAhorro") %>'  ></asp:Label>
															  </ItemTemplate>
														  </asp:TemplateField>
													  </Columns>
												  </asp:GridView>
											</div>
								</section>
							</form>
						</div>
					</div>
                    <uc2:UCNavegacion  runat ="server" ID ="ControlMenu"/>
			   </div>
	</body>
</html>>
