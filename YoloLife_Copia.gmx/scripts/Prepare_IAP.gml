// Cargar y Activar los productos.   
var productList = ds_list_create();

var noAds = ds_map_create();
ds_map_add(pVidas, "id", "noads");
ds_map_add(pVidas, "title", "No Ads");
ds_map_add(noAds, "price", "$0.99");
ds_map_add(pVidas, "type", "Durable");
 
var pVidas = ds_map_create(); 
ds_map_add(pVidas, "id", "noads");
ds_map_add(pVidas, "title", "No Ads");
ds_map_add(pVidas, "type", "Durable");
 
var pArma = ds_map_create();
ds_map_add(pArma, "id", "noads");
ds_map_add(pArma, "title", "No Ads");
ds_map_add(pArma, "type", "Durable");

var pTiempo = ds_map_create();
ds_map_add(pTiempo, "id", "noads");
ds_map_add(pTiempo, "title", "No Ads");
ds_map_add(pTiempo, "type", "Durable");
   
ds_list_add(productList, pVidas);
ds_list_add(productList, pArma);
ds_list_add(productList, pTiempo);
iap_activate(productList);

ds_map_destroy(pVidas);
ds_map_destroy(pArma);
ds_map_destroy(pTiempo);
ds_list_destroy(productList);
