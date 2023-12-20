<%@ Page Title="" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="ENCUESTA.aspx.cs" Inherits="EXAMEN3_MIGUELSOTOAGUILAR.ENCUESTA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div class="container text-center">
        <h1>Encuestas</h1>
    </div>

    

    <div class="container text-center">

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Nombre</label>
            <asp:TextBox ID="txt_nombre" class="form-control" runat="server" required></asp:TextBox>
            
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Fecha de Nacimiento</label>
            <asp:TextBox ID="txt_fechaNacimiento" class="form-control" runat="server" required></asp:TextBox>
            
        </div>

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Correo Electrónico</label>
            
            <asp:TextBox ID="txt_correoElectronico" type="email " class="form-control" runat="server" ></asp:TextBox>
            
        </div>

        

        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Partido Político</label>
          
            

            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            
        </div>
        <div class="container text-center">

            <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="Button1_Click"   />
            <asp:Button ID="Button2" class="btn btn-outline-primary" runat="server" Text="Borrar"  />
            
        </div>
        </div>
</asp:Content>
