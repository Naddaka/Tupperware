<!DOCTYPE html>
<html lang="ru">
<head>
<title>{$site_title}</title>
<meta name="description" content="{$site_description}" />
<meta name="keywords" content="{$site_keywords}" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="{$THEME}css/base.css" />
<link rel="stylesheet" href="{$THEME}css/amazium.css" />
<link rel="stylesheet" href="{$THEME}css/style.css" />
<link rel="stylesheet" href="{$THEME}css/adaptive.css" />
<link rel="stylesheet" href="{$THEME}css/menu.css" />
<link rel="stylesheet" href="{$THEME}css/slider.css" />


<link rel="apple-touch-icon" sizes="57x57" href="{$THEME}img/favicon/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="{$THEME}img/favicon/apple-touch-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="{$THEME}img/favicon/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="{$THEME}img/favicon/apple-touch-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="{$THEME}img/favicon/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="{$THEME}img/favicon/apple-touch-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="{$THEME}img/favicon/apple-touch-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="{$THEME}img/favicon/apple-touch-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="{$THEME}img/favicon/apple-touch-icon-180x180.png">
        <link rel="icon" type="image/png" href="{$THEME}img/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="{$THEME}img/favicon/android-chrome-192x192.png" sizes="192x192">
        <link rel="icon" type="image/png" href="{$THEME}img/favicon/favicon-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="{$THEME}img/favicon/favicon-16x16.png" sizes="16x16">
        <link rel="manifest" href="{$THEME}img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="msapplication-TileImage" content="{$THEME}img/favicon/mstile-144x144.png">
{literal}
<style>
html {
  height: 100%;
  font-size: 14px;/*background-color: #666;*/
}
body {
  min-height: 100%; /*100% высота сайта */
  height: 100%;
  max-width: 1920px;
  background-color: #222;
  margin: 0 auto;
  padding: 0;
  position: relative;
  font-size: 100%;
  color: #fff
}
</style>
{/literal}
</head>
<body style="position:relative">
<div style="position:absolute; width: 400px; height:400px; left:50%; top:40%; margin-left:-200px; margin-top:-200px; text-align:center; font-family: Verdana, Geneva, sans-serif">
<img src="{echo siteinfo('siteinfo_logo')}">
<br>
<br><br><br>
{echo siteinfo('siteinfo_offline')}

</div>
<div style="width:436px; position:absolute; top:60%; left:50%; margin-left:-218px">
 {echo siteinfo('siteinfo_offline2')}
</div>
</body>