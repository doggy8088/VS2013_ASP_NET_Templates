<%@ Page Title="管理帳戶" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebForms.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
   <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" ShowModelStateErrors="true" CssClass="text-error" />
    </div>

    <div class="row-fluid">
        <div class="span6">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        您沒有此站台的本機密碼。新增本機
                        密碼可以在沒有外部登入的情況下登入。
                    </p>
                    <fieldset class="form-horizontal">
                        <legend>設定密碼表單</legend>
                        <div class="control-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="control-label">密碼</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="password" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-error" ErrorMessage="必須填寫密碼欄位。"
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-error" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="control-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="control-label">確認密碼</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="必須填寫確認密碼欄位。"
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="密碼和確認密碼不相符。"
                                    ValidationGroup="SetPassword" />

                            </div>
                        </div>

                        <div class="form-actions no-color">
                            <asp:Button runat="server" Text="設定密碼" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn" />
                        </div>
                    </fieldset>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <p>您是以下列身分登入 <strong><%: User.Identity.GetUserName() %></strong>.</p>
                    <fieldset class="form-horizontal">
                        <legend>變更密碼形式</legend>
                        <div class="control-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="control-label">目前密碼</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-error" ErrorMessage="確認密碼欄位是必要欄位。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="control-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="control-label">新密碼</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-error" ErrorMessage="需要新密碼。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="control-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="control-label">確認新密碼</asp:Label>
                            <div class="controls">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="需要確認新密碼。"
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="新密碼與確認密碼不相符。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-actions no-color">
                            <asp:Button runat="server" Text="變更密碼" OnClick="ChangePassword_Click" CssClass="btn" ValidationGroup="ChangePassword" />
                        </div>
                    </fieldset>
                </asp:PlaceHolder>
            </section>

            <section id="externalLoginsForm">

                <asp:ListView runat="server"
                    ItemType="Microsoft.AspNet.Identity.IUserLogin"
                    SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                    <LayoutTemplate>
                        <h3>受限制的登入</h3>
                        <table class="table">                           
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.LoginProvider %></td>
                            <td>
                                <asp:Button runat="server" Text="移除" CommandName="Delete" CausesValidation="false"
                                    ToolTip='<%# "從您的帳戶" + Item.LoginProvider + "移除此登入" %>'
                                    Visible="<%# CanRemoveExternalLogins %>" CssClass="btn" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/Manage" />
            </section>

        </div>
    </div>

</asp:Content>
