<%@ Page Title="註冊外部登入" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterExternalLogin.aspx.cs" Inherits="WebFormsMVC.Account.RegisterExternalLogin" Async="true" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <header>
        <h1>以您的 <%: ProviderName %> 帳戶登入</h1>
    </header>

    <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-error" />
    <asp:PlaceHolder runat="server" >
        <fieldset class="form-horizontal">
            <legend>關聯表單</legend>
            <p class="text-info">
                您已透過 <strong><%: ProviderName %></strong>. 進行驗證。請在下方輸入目前網站的使用者名稱
                並按一下 [記錄] 按鈕。
            </p>

            <div class="control-group">
                <asp:Label runat="server" AssociatedControlID="userName" CssClass="control-label">使用者名稱</asp:Label>
                <div class="controls">
                    <asp:TextBox runat="server" ID="userName" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                        Display="Dynamic" CssClass="text-error" ErrorMessage="需要使用者名稱" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-error" />
                </div>
            </div>

            <div class="form-actions no-color">
                <asp:Button runat="server" Text="登入" CssClass="btn" OnClick="LogIn_Click" />
            </div>
        </fieldset>
    </asp:PlaceHolder>
</asp:Content>
