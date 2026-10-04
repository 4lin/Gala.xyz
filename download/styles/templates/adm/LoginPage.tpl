{include file="overall_header.tpl"}
<style>
#content.admin-login {
    float: none;
    width: calc(100% - 32px);
    max-width: 480px;
    margin: 0 auto;
    padding: 12vh 0 24px;
    box-sizing: border-box;
}
#content.admin-login table { width: 100%; margin: 0; }
.admin-login td { padding: 22px 16px; text-align: center; }
.admin-login td > div { margin: 12px 0; }
.admin-login input[type="submit"] {
    min-width: 110px;
    min-height: 38px;
    padding: 8px 22px;
    font-size: 14px;
    cursor: pointer;
}
@media (max-width: 440px) {
    .admin-login label { display: block !important; width: auto !important; margin-bottom: 6px; }
}
</style>
<div id="content" class="admin-login">
	<form action="" method="POST">
    <table>
		<tr>
            <th>{$LNG.adm_login}</th>
        </tr>
		<tr>
            <td>
				<div><label style="display:inline-block;width:100px;">{$LNG.adm_username}:</label><input type="text" readonly value="{$username}"></div>
				<div><label style="display:inline-block;width:100px;">{$LNG.adm_password}:</label><input type="password" name="admin_pw"></div>
				<div><input type="submit" value="{$LNG.adm_absenden}"></div>
			</td>
        </tr>
    </table>
	</form>
</div>
{include file="overall_footer.tpl"}