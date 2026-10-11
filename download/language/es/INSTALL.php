<?php

/**
 *  2Moons 
 *   by Jan-Otto Kröpke 2009-2016
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package 2Moons
 * @author Jan-Otto Kröpke <slaver7@gmail.com>
 * @copyright 2009 Lucky
 * @copyright 2016 Jan-Otto Kröpke <slaver7@gmail.com>
 * @licence MIT
 * @version 1.8.0
 * @link https://github.com/jkroepke/2Moons
 */


$LNG['back'] = 'Atrás';
$LNG['continue'] = 'Continuar';
$LNG['continueUpgrade'] = 'Continuar actualización';
$LNG['login'] = 'Iniciar sesión';

$LNG['menu_intro'] = 'Intro';
$LNG['menu_install'] = 'Instalar';
$LNG['menu_license'] = 'Licencia';
$LNG['menu_upgrade'] = 'Actualización';

$LNG['title_install'] = 'Instalador';

$LNG['intro_lang'] = 'Idioma';
$LNG['intro_install'] = 'Iniciar instalación';
$LNG['intro_welcome'] = 'Bienvenido a 2Moons!';
$LNG['intro_text'] = '2Moons es uno de los mejores clones de OGame. <br> 2Moons es la última y más estable versión de un servidor basado en Xnova que ah sido desarrollada. Los puntos clave de 2Moons son su facilidad, estabilidad, flexibilidad, dinamismo y calidad. En 2Moons siempre esperamos a ser más que sus expectativas. <br> El sistema de instalación le guiará a través de la instalación o la actualización de una versión previa a la última. <br>  Si tiene preguntas o problemas, por favor, no dude en comunicarse en nuestro foro de desarrollo y soporte. <br> 2Moons es un proyecto de código abierto y está bajo licencia GNU GPL v3. Para conocer la licencia, por favor haga click en la opción del menú correspondiente. <br> Antes de comenzar la instalación se lleva a cabo una prueba para saber si el servidor cumple los requisitos mínimos.';
$LNG['intro_upgrade_head'] = '¿Ya tienes 2Moons instalado?';
$LNG['intro_upgrade_text'] = '<p>Actualiza una instalación existente de 2Moons.</p><p>El asistente te guiará en la actualización de la base de datos.</p>';

$LNG['upgrade_success'] = 'Base de datos actualizada correctamente a la revisión %s.';
$LNG['upgrade_nothingtodo'] = 'No es necesario actualizar. La base de datos ya está en la revisión %s.';
$LNG['upgrade_back'] = 'Atrás';
$LNG['upgrade_intro_welcome'] = '¡Bienvenido al actualizador de la base de datos!';
$LNG['upgrade_available'] = 'La base de datos puede actualizarse de la revisión %s a la revisión %s.<br><br>Selecciona la primera actualización SQL que deseas instalar:';
$LNG['upgrade_notavailable'] = 'La revisión %s es la última revisión de la base de datos.';
$LNG['upgrade_required_rev'] = 'El actualizador requiere la revisión r2579 (2Moons v1.7) o posterior.';

$LNG['licence_head'] = 'Condiciones de la licencia';
$LNG['licence_desc'] = 'Lee las condiciones de la licencia. Desplázate para leer el documento completo.';
$LNG['licence_accept'] = 'Acepta las condiciones de la licencia para continuar con la instalación de 2Moons.';
$LNG['licence_need_accept'] = 'Debes aceptar las condiciones de la licencia para continuar.';

$LNG['req_head'] = 'Requisitos del sistema';
$LNG['req_desc'] = 'El instalador comprueba si el servidor cumple los requisitos. Revisa los resultados antes de continuar.';
$LNG['reg_yes'] = 'Sí';
$LNG['reg_no'] = 'No';
$LNG['reg_found'] = 'Encontrado';
$LNG['reg_not_found'] = 'No encontrado';
$LNG['reg_writable'] = 'Escritura';
$LNG['reg_not_writable'] = 'No escribible';
$LNG['reg_file'] = '¿Se puede escribir en el archivo &raquo;%s&laquo;?';
$LNG['reg_dir'] = '¿Se puede escribir en el directorio &raquo;%s&laquo;?';
$LNG['reg_gd_need'] = '¿GB-Lib disponible?';
$LNG['reg_gd_desc'] = '<strong>Opcional</strong> — La extensión GD genera imágenes dinámicas.';
$LNG['reg_mysqli_active'] = '¿Extensión MySQLi disponible?';
$LNG['reg_mysqli_desc'] = 'Compatibilidad de PHP con conexiones de base de datos mediante MySQLi.';
$LNG['reg_json_need'] = '¿JSON disponible?';
$LNG['reg_iniset_need'] = '¿ini_set() disponible?';
$LNG['reg_global_need'] = '¿register_globals desactivadas?';
$LNG['reg_global_desc'] = 'Por seguridad, register_globals debe estar desactivado en la configuración de PHP.';
$LNG['req_php_need'] = 'Versión PHP (min. 5.2.5)';
$LNG['req_php_need_desc'] = '<strong>Obligatorio</strong> — PHP ejecuta el juego. El instalador comprueba la versión requerida.';

$LNG['req_ftp_head'] = 'Datos de conexión FTP';
$LNG['req_ftp_desc'] = 'Introduce los datos de conexión FTP para reparar los permisos de los archivos, o establece los permisos de escritura manualmente.';
$LNG['req_ftp_host'] = 'Host FTP';
$LNG['req_ftp_username'] = 'Usuario';
$LNG['req_ftp_password'] = 'Contraseña';
$LNG['req_ftp_dir'] = 'Directorio de 2Moons';
$LNG['req_ftp_send'] = 'Enviar';
$LNG['req_ftp_error_data'] = 'No se ha podido conectar al servidor FTP con estos datos.';
$LNG['req_ftp_error_dir'] = 'El directorio indicado no es válido o no existe.';

$LNG['step1_head'] = 'Configuración de la base de datos';
$LNG['step1_desc'] = 'Introduce los datos de conexión a la base de datos. Contacta con tu proveedor de alojamiento si desconoces estos ajustes.';
$LNG['step1_mysql_server'] = 'Servidor MySQL: <br>Estandart: localhost';
$LNG['step1_mysql_port'] = 'Puerto del Servidor MySQL: <br>Estandart: 3306';
$LNG['step1_mysql_dbname'] = 'Nombre BD MySQL: <br> Ej.: Game';
$LNG['step1_mysql_dbuser'] = 'Usuario MySQL: <br> Ej.: root';
$LNG['step1_mysql_dbpass'] = 'Contraseña MySQL: <br> Ej.: 12345';
$LNG['step1_mysql_prefix'] = 'Prefijo Tablas BD MySQL: <br> Ej.: uni1_';

$LNG['step2_db_no_dbname'] = 'Introduce el nombre de la base de datos.';
$LNG['step2_db_too_long'] = 'El prefijo de las tablas no debe superar los 36 caracteres.';
$LNG['step2_db_con_fail'] = 'No se ha podido conectar a la base de datos. Detalles:';
$LNG['step2_config_exists'] = '¡config.php ya existe!';
$LNG['step2_conf_op_fail'] = "¡config.php no esta en modo escritura (CHMOD 777)!";
$LNG['step2_conf_create'] = "config.php creado satisfactoriamente...";
$LNG['step2_prefix_invalid'] = 'El prefijo DB debe contener sólo caracteres alfanuméricos y guiones.';
$LNG['step2_db_done'] = '¡Conexión a la base de datos correcta!';

$LNG['step3_head'] = 'Crear las tablas de la base de datos';
$LNG['step3_desc'] = 'Crea las tablas de la base de datos e introduce sus valores iniciales.';
$LNG['step3_db_error'] = 'No se han podido crear las tablas de la base de datos:';

$LNG['step4_head'] = 'Cuenta del administrador';
$LNG['step4_desc'] = 'Introduce el nombre de usuario, la contraseña y el correo electrónico para la cuenta del administrador.';
$LNG['step4_admin_name'] = 'Nombre de usuario del administrador:';
$LNG['step4_admin_name_desc'] = 'Introduce un nombre de usuario de 3 a 20 caracteres.';
$LNG['step4_admin_pass'] = 'Contraseña del administrador:';
$LNG['step4_admin_pass_desc'] = 'Introduce una contraseña de 6 a 30 caracteres.';
$LNG['step4_admin_mail'] = 'Correo electrónico de contacto:';

$LNG['step6_head'] = '¡Instalación completada!';
$LNG['step6_desc'] = '2Moons se ha instalado correctamente.';
$LNG['step6_info_head'] = 'Empieza a utilizar 2Moons';
$LNG['step6_info_additional'] = 'El botón inferior abre el panel de administración.<br><br><strong>Elimina o renombra includes/ENABLE_INSTALL_TOOL para impedir que se vuelva a utilizar el instalador.</strong>';

$LNG['sql_close_reason'] = 'El juego está actualmente cerrado';
$LNG['sql_welcome'] = 'Bienvenido a ';

// Translated into Spanish by Scofield06 . All rights reversed (C) 2011
$LNG['reg_pdo_active'] = '¿Extensión PDO disponible?';
$LNG['reg_pdo_desc'] = '<strong>Obligatorio</strong> — PHP debe admitir conexiones de base de datos mediante PDO.';
$LNG['step8_need_fields'] = 'Completa todos los campos.';
$LNG['reg_bcmath_need'] = '¿Extensión BCMath disponible?';
$LNG['req_ftp_pass_info'] = 'Contraseña de la cuenta FTP.';
$LNG['step2_db_create_ok'] = 'Base de datos creada correctamente.';
$LNG['sql_universe'] = 'Universo';
$LNG['intro_instal'] = 'Iniciar instalación';
$LNG['req_ftp'] = 'Datos de conexión FTP';
$LNG['req_ftp_info'] = 'Introduce los datos de conexión FTP para reparar los permisos de los archivos, o establece los permisos de escritura manualmente.';
$LNG['step2_db_error'] = 'No se ha podido conectar a la base de datos. Detalles:';
$LNG['step2_db_connet_ok'] = '¡Conexión a la base de datos correcta!';
$LNG['step3_create_admin'] = 'Cuenta del administrador';
$LNG['step3_admin_name'] = 'Nombre de usuario del administrador:';
$LNG['step3_admin_pass'] = 'Contraseña del administrador:';
$LNG['step3_admin_mail'] = 'Correo electrónico de contacto:';
$LNG['step4_need_fields'] = 'Completa todos los campos.';
