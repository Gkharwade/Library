<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Library.Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      
    <!DOCTYPE html>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 80px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }
        button:hover {
            background: #218838;
        }
    </style>


    <div class="container">
        <h2>Add Books Data</h2>
        <div>
            <input type="text" runat="server" id="btitle" placeholder="Book Title" required>
            <input type="text" runat="server" id="Author" placeholder="Author" required>
            <input type="text" runat="server" id="ISBN" placeholder="ISBN" required>
            <input type="text" runat="server" id="Publisher" placeholder="Publisher" required>
            <input type="text" runat="server" id="Category" placeholder="Category" required>
            <input type="text" runat="server" id="Quantity" placeholder="Quantity" required>
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success btn-block btn-lg gradient-custom-4 text-body" ToolTip="Submit" OnClick="Button1_Click"/>  
</div>
        </div>

</asp:Content>
