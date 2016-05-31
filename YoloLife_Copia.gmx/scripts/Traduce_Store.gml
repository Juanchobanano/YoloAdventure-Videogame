/// Traduce_Store(category)
var cat = argument[0];

// Money: 0 - Powers: 1 - Skins: 2 - Gems: 3
if(idioma == "en"){
    switch(cat){
        case 0:
            ti = Traduce(
                "Gold bars & Cristals", 
                "Watch a video!", 
                "Gold MiniPack!", 
                "Gold ExtraPack!", 
                "Gold MegaPack!",
                "Gold UltraPack!",
                "Gold YoloPack!", 
                "Definite Gold Pack!"
            );
            
            des = Traduce(
                "",
                "Get gold instantly!",
                "Perfect for ocacional#purchases!",
                "Most purchased!", 
                "What you NEED!",
                "Ideal for frecuently players!",
                "This is madness!",
                "You will NEVER get worry for money AGAIN!"
            );
        break;
        case 1:
            ti = Traduce(
                "Powers!", 
                "Freeze Power x 3!", 
                "Slodown Power x 3!",
                "Checkpoint (Door) x 3"
            );
            
            des = Traduce(
                "", 
                "Freeze all enemies for 3#seconds!", 
                "Slowdown all enemies for 3#seconds!", 
                "Create a Checkpoint in the#place where you are!"
            );
        break;
        case 2:
            ti = Traduce(
                "Skins",
                "Clasico",
                "Nacional Flag:#Colombia",
                "Nacional Flag:#Chile", 
                "Nacional Flag:#Argentina",
                "Nacional Flag:#Mexico",
                "Nacional Flag:#Costa Rica",
                "Nacional Flag:#EEUU", 
                "Nacional Flag:#Germany",
                "Nacional Flag:#Spain",
                "Nacional Flag:#Guatemala",
                "Nacional Flag:#England"                
            );
            
            des = Traduce(
                "",
                "Sometimes the vintage...is the best!", 
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            );
        break;
        case 3:
            ti = Traduce(
                "Gems", 
                "Classic Gem",
                "Gravity Gem!",
                "JumpSpeed Gem!",
                "Gold Bars x 2",
                "Attract Gold!", 
                "Movement Gem!"
            );
            
            des = Traduce(
                "",
                "Sometimes the vintage...is the best!",
                "Decrease the gravity and the#jumpspeed",
                "Increase the JumpSpeed!",
                "Gold Bars value increase x2!",
                "Attract Gold in a radius of#20 pixels",
                "Increase the movement speed!"          
            );
        break;      
    }
}else if(idioma == "es"){
     switch(cat){
        case 0:
            ti = Traduce(
                "Barras de Oro & Cristales", 
                "Mira un video!", 
                "MiniPack de Oro!", 
                "ExtraPack de Oro!", 
                "MegaPack de Oro!",
                "UltraPack de Oro!",
                "YoloPack de Oro!", 
                "Pack de oro definitivo!"
            );
            
            des = Traduce(
                "",
                "Consigue dinero al instante!",
                "Perfecto para compras ocacionales!",
                "Lo más comprado!", 
                "Lo que NECESITAS!",
                "Ideal para jugadores frecuentes!",
                "Esto es una locura!",
                "NUNCA más te preocuparas por el dinero de NUEVO!"
            );
        break;
        case 1:
            ti = Traduce(
                "Poderes!", 
                "Poder de congelacion!", 
                "Poder de relantizacion!",
                "Checkpoint (Puerta)"
            );
            
            des = Traduce(
                "", 
                "Congela a todos los enemigos#por 3 segundos!", 
                "Ralentiza por 3 segundos a#todos los enemigos!", 
                "Crea un Checkpoint en el lugar#en donde estes!"
            );
        break;
        case 2:
            ti = Traduce(
                "Skins",
                "Clasico",
                "Bandera Nacional:#Colombia",
                "Bandera Nacional:#Chile", 
                "Bandera Nacional:#Argentina",
                "Bandera Nacional:#Mexico",
                "Bandera Nacional:#Costa Rica",
                "Bandera Nacional:#EEUU", 
                "Bandera Nacional:#Alemania",
                "Bandera Nacional:#Espana",
                "Bandera Nacional:#Guatemala",
                "Bandera Nacional:#Inglaterra"                
            );
            
            des = Traduce(
                "",
                "Alguna veces lo clasico...es lo mejor!", 
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            );
        break;
        case 3:
            ti = Traduce(
                "Gemas", 
                "Gema Clasica",
                "Gema de Gravedad!",
                "Gema de Salto!",
                "Barras de Oro x2",
                "Atraer Oro!", 
                "Gema de Movimiento!"
            );
            
            des = Traduce(
                "",
                "A veces lo clasico...es lo mejor!",
                "Disminuye la gravedad y el#salto!",
                "Aumenta el Salto!",
                "El valor de las barras de#oro x2",
                "Atrae oro en un radio de#20 pixeles!",
                "Aumenta la velocidad de#movimiento!", 
                ""
            );
        break;   
    }
}
