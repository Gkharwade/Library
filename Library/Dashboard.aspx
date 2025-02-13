<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Library.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div class="content">
    <h2>Welcome to Library Management</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview-custom table table-bordered"  AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
             <Columns>
                 <asp:BoundField DataField="BookId" HeaderText="Book ID" ReadOnly="True" />
                 <asp:BoundField DataField="Title" HeaderText="Title" />
                 <asp:BoundField DataField="Author" HeaderText="Author" />
                 <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                 <asp:BoundField DataField="Publisher" HeaderText="Publisher" />
                 <asp:BoundField DataField="Category" HeaderText="Category" />
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
             </Columns>
         </asp:GridView>
</div>


   

    <style>
        /* Centering the GridView */
        .grid-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .table-container {
            width: 80%; /* You can adjust the width as per your preference */
            margin: 0 auto;
            
        }
    </style>
</asp:Content>
