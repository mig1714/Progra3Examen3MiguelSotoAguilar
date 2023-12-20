<%@ Page Title="" Language="C#" MasterPageFile="~/inicio.Master" AutoEventWireup="true" CodeBehind="reporte.aspx.cs" Inherits="EXAMEN3_MIGUELSOTOAGUILAR.reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h1>Reporte Encuestas</h1>
    </div>
    <div>
        <div class="container text-center">
        <asp:GridView ID="datagrid" CssClass="mydatagrid" PageSize="10" HorizontalAlign="Center"
            AutoGenerateColumns="true" PagerStyle-CssClass="pager" runat="server" 
            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="true" ></asp:GridView>
        <br />
        <br />
    </div>
    </div>
</asp:Content>
