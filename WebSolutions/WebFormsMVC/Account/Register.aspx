<%@ Page Title="註冊" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebFormsMVC.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>       
    <//hgroup>
    <p class="text-error">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <fieldset class="form-horizontal">
        <legend>建立新帳戶。</legend>
        <div class="control-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label">使用者名稱</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="UserName" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-error" ErrorMessage="必須填寫使用者名稱欄位。" />
            </div>
        </div>
        <div class="control-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label">密碼</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-error" ErrorMessage="必須填寫密碼欄位。" />
            </div>
        </div>
        <div class="control-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label">確認密碼</asp:Label>
            <div class="controls">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-error" Display="Dynamic" ErrorMessage="必須填寫確認密碼欄位。" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-error" Display="Dynamic" ErrorMessage="密碼和確認密碼不相符。" />
            </div>
        </div>
        <div class="form-actions no-color">
            <asp:Button runat="server" OnClick="CreateUser_Click" Text="註冊" CssClass="btn" />
        </div>
    </fieldset>

</asp:Content>
