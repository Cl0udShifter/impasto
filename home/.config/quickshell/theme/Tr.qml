// ╭──────────────────────────────────────────────────────────────────────────╮
// │                                                                          │
// │   T R                                                                    │
// │   singleton · what language the shell speaks                             │
// │                                                                          │
// │   github.com/andreumassanet/impasto                                      │
// │                                                                          │
// ╰──────────────────────────────────────────────────────────────────────────╯

pragma Singleton

import QtQuick

import "../services"

// Translations, keyed by the English source string, so a missing
// translation falls back to English rather than to an id. `t` reads
// `language`, so bindings through it update when the setting changes.
//
// Grouped by settings page, in page order; strings used on several pages are
// under SHARED.
QtObject {
    id: root

    readonly property string language: SettingsService.language

    readonly property var languages: [
        { id: "en", label: "English" },
        { id: "es", label: "Español" },
        { id: "pt", label: "Português (Brasil)" }
    ]

    function t(text: string): string {
        if (root.language === "en")
            return text
        const table = root.tables[root.language]
        return (table && table[text]) ? table[text] : text
    }

    readonly property var tables: ({
        es: {
            // ── SHARED ──────────────────────────────────────────────────────
            "Search settings": "Buscar ajustes",
            "Reset": "Restablecer",
            "Open": "Abrir",
            "Clear": "Quitar",
            "Edit": "Editar",
            "Done": "Hecho",
            "Cancel": "Cancelar",
            "Apply": "Aplicar",
            "Remove": "Quitar",
            "Size": "Tamaño",
            "Scale": "Escala",
            "Shape": "Forma",
            "Shown": "Visible",
            "Hidden": "Oculto",
            "None": "Ninguno",
            "Off": "Apagado",
            "On": "Encendido",
            "Default": "Por defecto",
            "default": "por defecto",
            "Custom": "Personalizado",
            "Left": "Izquierda",
            "Right": "Derecha",
            "Bottom": "Abajo",
            "Start": "Principio",
            "Middle": "Centro",
            "End": "Final",
            "Applications": "Aplicaciones",
            "Search applications": "Busca aplicaciones",
            "Windows": "Ventanas",
            "Window": "Ventana",
            "Screen": "Pantalla",
            "Region": "Región",
            "Workspaces": "Espacios de trabajo",
            "Tray": "Bandeja",
            "Privacy": "Privacidad",
            "Sound": "Sonido",
            "%1 screens": "%1 pantallas",
            "Screens": "Pantallas",
            "Warmth": "Calidez",
            "Presets": "Rápidos",
            "Candle": "Vela",
            "Warm": "Cálida",
            "Soft": "Suave",
            "Neutral": "Neutra",
            "Recording": "Grabando",
            "What uses the microphone, camera or screen": "Qué usa el micrófono, la cámara o la pantalla",
            "Not shown": "No se muestra",
            "now": "ahora",
            "Theme": "Tema",
            "Face": "Temática",
            "Style": "Estilo",
            "Palette": "Paleta",
            "Settings": "Ajustes",
            "Wallpaper": "Fondo",
            "Blur": "Desenfoque",
            "Background": "Fondo",
            "Arrangement": "Disposición",

            // ── THE PANEL ───────────────────────────────────────────────────
            "THE SHELL": "EL SHELL",
            "THE DESK": "EL ESCRITORIO",
            "THE SESSION": "LA SESIÓN",

            "Modules": "Módulos",
            "Desktop": "Escritorio",
            "What sits on the wallpaper, under the windows.":
                "Lo que se queda sobre el fondo, debajo de las ventanas.",
            "Control Centre": "Centro de control",
            "What the island opens onto when you click it.":
                "Lo que abre la isla al hacer clic en ella.",
            "Dock": "Dock",
            "The dock and the applications kept on it.":
                "El dock y las aplicaciones que guardas en él.",
            "Launcher": "Lanzador",
            "Search, sigils and the clipboard history.":
                "Búsqueda, prefijos e historial del portapapeles.",
            "Results": "Resultados",
            "Sigils": "Prefijos",
            "Clipboard": "Portapapeles",
            "Appearance": "Apariencia",
            "Type": "Tipografía",
            "Motion": "Movimiento",
            "Displays": "Pantallas",
            "Screen layout, modes and the laptop lid.":
                "Disposición y modos de las pantallas, y la tapa del portátil.",
            "The screen": "La pantalla",
            "The lid": "La tapa",
            "Input": "Entrada",
            "The keyboard, the pointer and the cursor.":
                "El teclado, el puntero y el cursor.",
            "Keyboard": "Teclado",
            "Pointer": "Puntero",
            "Keys": "Atajos",
            "Every keybinding, the shell's and Hyprland's.":
                "Todos los atajos, los del shell y los de Hyprland.",
            "Session": "Sesión",
            "Lock screen": "Pantalla de bloqueo",
            "Lock": "Bloquear",
            "Suspend": "Suspender",
            "Log out": "Cerrar sesión",
            "Restart": "Reiniciar",
            "Shut down": "Apagar",
            "When you leave": "Cuando te vas",
            "System": "Sistema",
            "Profiles": "Perfiles",

            // ── BAR & ISLAND ────────────────────────────────────────────────
            "The island": "La isla",
            "Island": "Isla",
            "Grouped": "Agrupada",
            "Spread": "Repartida",
            "The workspaces, the island and the modules together in the middle.":
                "Los espacios, la isla y los módulos, juntos en el centro.",
            "The workspaces at one edge, the modules at the other, the island between them.":
                "Los espacios en un borde, los módulos en el otro, y la isla entre ellos.",
            "Everything inside a single capsule.": "Todo dentro de una sola cápsula.",
            "A band across the whole top edge, with the island dropping out of its middle.":
                "Una banda a lo largo de todo el borde superior, con la isla saliendo de su centro.",
            "Bezel": "Marco",
            "The bezel is always cut into the top edge": "El marco siempre va pegado al borde superior",
            "A glance on hover": "Un vistazo al pasar el cursor",
            "Resting the pointer on the island opens it": "Dejar el cursor sobre la isla lo abre",
            "Only a click opens anything": "Solo un clic abre algo",
            "Lyrics": "Letras",
            "The playing track's lyrics are looked up on lrclib.net": "La letra de lo que suena se busca en lrclib.net",
            "No lyrics, and nothing is looked up": "Sin letras, y no se busca nada",
            "Instrumental": "Instrumental",
            "Lyrics are off": "Letras desactivadas",
            "Nothing playing": "No suena nada",
            "Looking for lyrics": "Buscando la letra",
            "No lyrics for this one": "Esta no tiene letra",
            "Lyrics, untimed": "Letra sin tiempos",
            "A region": "Una región",
            "A window": "Una ventana",
            "Flip": "Tarjetas",
            "Music": "Música",
            "Only while something is playing.": "Solo mientras suena algo.",
            "Show": "Mostrar",
            "Nothing": "Nada",
            "The player": "El reproductor",
            "With lyrics": "Con letra",
            "Behind it": "Detrás",
            "The cover": "La portada",
            "Muted": "Silenciado",
            "Cut into the top edge": "Recortada en el borde superior",
            "Floating below the top edge": "Flotando bajo el borde superior",
            "Floating": "Flotante",
            "One island": "Una isla",
            "Edge to edge": "De borde a borde",
            "The bar itself is the preview: it repaints over this window as the sliders move.":
                "La vista previa es la propia barra: se repinta sobre esta ventana mientras mueves los controles.",
            "Everything on the bar scales with its height. The top margin is the gap to the screen edge (the island ignores it in notch mode), and the side margin is the inset from the left and right edges.":
                "Todo lo de la barra escala con su altura. El margen superior es la distancia al borde de la pantalla (la isla lo ignora en modo notch) y el lateral, la separación de los bordes izquierdo y derecho.",
            "Bar height": "Altura de la barra",
            "Top margin": "Margen superior",
            "Side margin": "Margen lateral",
            "The shown workspaces are always drawn; the rest, up to the available count, appear only while they have windows.":
                "Los espacios visibles se dibujan siempre; el resto, hasta los disponibles, solo aparecen mientras tienen ventanas.",
            "Workspaces shown": "Espacios visibles",
            "Workspaces available": "Espacios disponibles",

            "Notifications": "Notificaciones",
            "New notifications appear briefly in the island.":
                "Las notificaciones nuevas aparecen un momento en la isla.",
            "The shell is the notification daemon: notifications without their own timeout use the time below, and critical ones stay until dismissed. Do not disturb only keeps them off the screen; they still collect in the control centre until the shell restarts.":
                "El shell es el demonio de notificaciones: las que no indican su propia duración usan el tiempo de abajo, y las críticas se quedan hasta que las cierras. No molestar solo evita que ocupen la pantalla; siguen acumulándose en el centro de control hasta que el shell se reinicia.",
            "How long one stays": "Cuánto se queda una",
            "Nothing is shown while Do not disturb is on":
                "No se muestra nada con No molestar encendido",
            "Do not disturb": "No molestar",
            "Nothing takes the screen": "Nada toma la pantalla",
            "Everything is shown": "Se muestra todo",
            "Kept": "Guardadas",
            "in this session": "en esta sesión",
            "Nothing kept": "Nada guardado",

            // ── BAR & ISLAND · THE TIME ─────────────────────────────────────
            "The time": "La hora",
            "Beside the time": "Junto a la hora",
            "Shown on the resting island, and larger in the glance.":
                "Se muestra en la isla en reposo, y más grande en el vistazo.",
            "What is running sits either side of the time, two at most.":
                "Lo que está en marcha va a los lados de la hora, dos como mucho.",
            "A recording is always there and comes first; click its dot to stop it. Then the microphone, camera or screen in use, a countdown and media, which still work from their chips on the bar when kept off the island. The workspace comes last, for a bar without the strip; click it for the overview.":
                "Una grabación siempre está y va primero; haz clic en su punto para pararla. Luego el micrófono, la cámara o la pantalla en uso, una cuenta atrás y la música, que siguen funcionando desde su chip en la barra si los quitas de la isla. El escritorio va el último, para una barra sin la tira; haz clic en él para ver la vista general.",
            "Workspace": "Escritorio",
            "The one you are on": "En el que estás",
            "On the island while it runs": "En la isla mientras está en marcha",
            "Only where its chip is put": "Solo donde esté su pieza",

            // ── BAR & ISLAND · MODULES ──────────────────────────────────────
            "Chips": "Piezas",
            "Every piece on the bar follows these unless it was given its own.":
                "Todas las piezas de la barra siguen esto salvo que se les haya dado uno propio.",
            "Like the bar": "Como la barra",
            "When": "Cuándo",
            "The bar": "La barra",
            "While it runs": "Mientras está en marcha",
            "Nothing to set: it is drawn one way.": "Nada que ajustar: se dibuja de una sola forma.",
            "Rings": "Anillos",
            "Numbers": "Números",
            "Roman": "Romanos",
            "Kanji": "Kanji",
            "Greek": "Griego",
            "Icon shows the module's symbol; Ring draws the gauge of a module that measures something (charge, volume, a countdown) as a circle around it, and the rest keep their symbol. The figure is the value itself, and On hover shows it only while the pointer is over the chip.":
                "Icono muestra el símbolo del módulo; Anillo dibuja el indicador de los módulos que miden algo (carga, volumen, una cuenta atrás) como un círculo a su alrededor, y los demás se quedan con su símbolo. La cifra es el valor en sí, y Al pasar solo la muestra mientras el cursor está sobre la pieza.",
            "Icon": "Icono",
            "Ring": "Anillo",
            "The symbol alone, small.": "El símbolo solo, pequeño.",
            "The gauge, in a circle.": "El indicador, en un círculo.",
            "Figure": "Cifra",
            "No": "No",
            "On hover": "Al pasar",
            "Always": "Siempre",
            "No figure beside it": "Sin cifra al lado",
            "The figure opens under the pointer": "La cifra se abre bajo el cursor",
            "The figure always beside it": "La cifra siempre al lado",
            "Layout": "Disposición",
            "Drag a piece from the catalogue onto the bar.":
                "Arrastra una pieza del catálogo a la barra.",
            "Drop a piece on either half of the bar to place it on that side of the island; drag it along to move it or off the bar to remove it, and click it to give it its own shape and figure. Adjacent modules share a capsule, and a split starts a new one.":
                "Suelta una pieza en una mitad de la barra para ponerla en ese lado de la isla; arrástrala para moverla o fuera de la barra para quitarla, y haz clic en ella para darle forma y cifra propias. Los módulos contiguos comparten cápsula, y una separación empieza otra.",
            "Empty": "Vacío",
            "Search": "Buscar",
            "Overview": "Vista general",
            "Split": "Separación",

            "Media": "Multimedia",
            "Timer": "Temporizador",
            "Battery": "Batería",
            "Volume": "Volumen",
            "Brightness": "Brillo",
            "Network": "Red",
            "Weather": "Tiempo",
            "Markets": "Mercados",
            "Updates": "Actualizaciones",
            "Pet": "Mascota",
            "Spectrum": "Espectro",
            "Under the windows": "Debajo de las ventanas",
            "Fill": "Relleno",
            "From the edge": "Desde el borde",
            "To the tip": "Hasta la punta",
            "Height": "Altura",
            "Bars": "Barras",
            "Gap": "Hueco",
            "Lows": "Graves",
            "At the corners": "En las esquinas",
            "Peaks": "Picos",
            "Rounded columns": "Columnas redondeadas",
            "Square columns": "Columnas rectas",
            "Segments": "Segmentos",
            "Dots": "Puntos",
            "Fading to the tip": "Desvanecido hacia la punta",
            "Solid": "Sólido",
            "Two colours": "Dos colores",
            "Games": "Juegos",
            "Calendar": "Calendario",
            "Notes": "Notas",
            "Tasks": "Tareas",
            "Clock": "Reloj",
            "Photo": "Foto",

            // ── BAR & ISLAND · WHAT A MODULE KNOWS ──────────────────────────
            "Seconds make the clock repaint sixty times as often.":
                "Los segundos hacen que el reloj se repinte sesenta veces más a menudo.",
            "Clock format": "Formato de hora",
            "24-hour": "24 horas",
            "12-hour": "12 horas",
            "Show the date": "Mostrar la fecha",
            "The time alone": "Solo la hora",
            "Show seconds": "Mostrar segundos",

            "Left empty, wttr.in guesses from your connection's IP address, which can be far off. A city, postcode or airport code is more reliable, and the bar uses the same place.":
                "Si lo dejas vacío, wttr.in lo deduce de la IP de tu conexión, y puede fallar bastante. Una ciudad, un código postal o un código de aeropuerto es más fiable, y la barra usa el mismo lugar.",
            "Location": "Ubicación",
            "A city, a postcode or an airport code.":
                "Una ciudad, un código postal o un código de aeropuerto.",
            "Wherever the request comes from": "De donde venga la petición",
            "No such place — the last reading is still showing":
                "No existe ese lugar — se sigue mostrando la última lectura",

            "The graph is read from the public profile page, so no token or account is needed. It stays empty until you enter a username.":
                "El gráfico se lee de la página pública del perfil, así que no hace falta token ni cuenta. Queda vacío hasta que escribes un usuario.",
            "Username": "Usuario",
            "Whose public contribution graph to draw.":
                "De quién se dibuja el gráfico público de contribuciones.",
            "Nobody yet": "Nadie todavía",
            "No such profile — the last grid is still showing":
                "No existe ese perfil — se sigue mostrando la última cuadrícula",

            "The coins and currencies to follow, separated by commas.":
                "Las monedas y divisas que sigues, separadas por comas.",
            "A coin alone is priced in US dollars and BTC/EUR in euros; two currencies, such as EUR/USD, follow the European Central Bank's daily rate. Prices come from CoinGecko and Frankfurter, which see what you follow but need no account. The bar shows the first one.":
                "Una moneda sola se cotiza en dólares y BTC/EUR en euros; dos divisas, como EUR/USD, siguen el tipo diario del Banco Central Europeo. Los precios vienen de CoinGecko y Frankfurter, que ven lo que sigues pero no piden cuenta. La barra muestra el primero.",
            "Follow": "Seguir",
            "Not found:": "No encontrado:",

            "A note on the wallpaper is written the same way as one in the panel.":
                "Una nota en el fondo se escribe igual que una del panel.",
            "Handwriting": "A mano",
            "The signature's script": "La letra de la firma",
            "The interface face": "La tipografía de la interfaz",
            "Gone while a window is open": "Fuera mientras haya una ventana abierta",
            "Over the windows": "Sobre las ventanas",

            "How the creature is drawn, wherever it is drawn.":
                "Cómo se dibuja la criatura, en todas partes donde se dibuja.",
            "The species decides the colour and what the creature is; the style decides how it is drawn. The same drawing is used on the bar, in the pet's panel and on the desktop.":
                "La especie decide el color y qué criatura es; el estilo decide cómo se dibuja. El mismo dibujo se usa en la barra, en el panel de la mascota y en el escritorio.",
            "Creature": "Criatura",
            "A different animal for each species.":
                "Un animal distinto para cada especie.",
            "Plush": "Peluche",
            "One round body, shaded.": "Un solo cuerpo redondo, sombreado.",
            "Paper": "Papel",
            "Flat, cut from two tones.": "Plano, recortado en dos tonos.",
            "Pixel": "Píxel",
            "A sprite, sixteen cells across.":
                "Un sprite de dieciséis celdas de ancho.",

            "Unhatched — care for it and see": "Sin eclosionar — cuídalo y verás",
            "Bring out": "Sacar",
            "Out": "Fuera",
            "The next egg": "El próximo huevo",
            "Levels across the family": "Niveles de la familia",
            "All five found": "Los cinco encontrados",
            "Nothing left to find — there is a star waiting at level fifteen for each of them.":
                "No queda nada por encontrar — a cada una le espera una estrella en el nivel quince.",

            // ── DESKTOP ─────────────────────────────────────────────────────
            "The desktop": "El escritorio",
            "Widgets are arranged directly on the wallpaper.":
                "Los widgets se colocan directamente sobre el fondo.",
            "Arranging brings the widgets in front of the windows, with a card of every module, moved by the space between them. Drag one onto the grid, pull a widget's corner to change its shape, click it for a look of its own, and drop it back on the card to take it off. Escape or the right button ends it, and the right button on any widget opens the same mode from the picture. This window closes meanwhile.":
                "Colocar trae los widgets por delante de las ventanas, con una tarjeta de todos los módulos que se mueve por el espacio entre ellos. Arrastra uno a la cuadrícula, tira de la esquina de un widget para cambiarle la forma, haz clic en él para darle un aspecto propio y suéltalo sobre la tarjeta para quitarlo. Esc o el botón derecho lo terminan, y el botón derecho sobre cualquier widget abre el mismo modo desde la imagen. Esta ventana se cierra mientras tanto.",
            "Arrange the desktop": "Colocar el escritorio",
            "Arrange widgets": "Colocar widgets",
            "on the wallpaper": "en el fondo",
            "Nothing on the wallpaper yet": "Nada en el fondo todavía",
            "Hide the widgets": "Ocultar los widgets",
            "Window layout": "Disposición de ventanas",
            "Look": "Aspecto",
            "Every widget follows these unless it was given a look of its own.":
                "Todos los widgets siguen esto salvo que se les haya dado un aspecto propio.",

            "Modern": "Modern",
            "Analogue": "Analógico",
            "Sticker": "Pegatina",
            "Small": "Pequeño",
            "Wide": "Ancho",
            "Large": "Grande",
            "Band": "Banda",

            "Notes on the edge": "Notas en el borde",
            "Where": "Dónde",
            "Grid": "Cuadrícula",
            "Along the edge": "A lo largo del borde",
            "Which notes": "Qué notas",
            "New notes land here": "Las notas nuevas van aquí",
            "Which note": "Qué nota",
            "Drop here to take it off": "Suéltalo aquí para quitarlo",
            "Drop here to leave it out": "Suéltalo aquí para no ponerlo",
            "The newest": "La más reciente",
            "New note": "Nota nueva",
            "Choose…": "Elegir…",
            "Caption": "Pie de foto",
            "Written under the picture": "Escrito bajo la foto",
            "Wallpapers": "Fondos",
            "Home": "Carpeta personal",
            "No pictures here": "Aquí no hay fotos",

            // ── CONTROL CENTRE ──────────────────────────────────────────────
            "The panel": "El panel",
            "Edit shows the grid, its columns and rows under the island, and a card of every block under them. Drag a block onto the cells, pull a corner or scroll to resize it, and drop it on the card to remove it; a click on a toggles or shortcuts block chooses what it carries. Columns come and go on both sides alike, so the blocks stay centred. Escape leaves, and the right button on the panel enters or leaves without opening settings.":
                "Editar muestra la cuadrícula, sus columnas y filas bajo la isla, y debajo una tarjeta con todos los bloques. Arrastra un bloque a las casillas, tira de una esquina o usa la rueda para cambiar su tamaño, y suéltalo en la tarjeta para quitarlo; haciendo clic en un bloque de conmutadores o de atajos eliges qué lleva. Las columnas se añaden y se quitan por los dos lados a la vez, así que los bloques quedan centrados. Esc sale, y con el botón derecho sobre el panel entras o sales sin abrir los ajustes.",
            "A grid of the size chosen here, arranged on the panel itself.":
                "Una cuadrícula del tamaño que elijas aquí, que se coloca en el propio panel.",
            "columns × rows": "columnas × filas",
            "At a glance": "De un vistazo",
            "Personal": "Personal",
            "Controls": "Controles",
            "Click the cell that should be the grid's corner": "Haz clic en la celda que será la esquina de la cuadrícula",
            "Ground": "Material",
            "Sides": "Laterales",
            "The icons on the wallpaper": "Los iconos sobre el fondo",
            "Each group in a capsule": "Cada grupo en una cápsula",
            "In one island the sides sit on its band": "En una isla los laterales van sobre su banda",
            "In capsules": "En cápsulas",
            "On the wallpaper": "Sobre el fondo",
            "Refraction": "Refracción",
            "Solid black": "Negro sólido",
            "The terminal's glass, over a blur": "El cristal de la terminal, sobre un desenfoque",
            "Classic": "Clásico",
            "Arrange the control centre": "Colocar el centro de control",
            "The top row": "La fila de arriba",
            "The top row: click to choose its buttons": "La fila de arriba: haz clic para elegir sus botones",
            "Small buttons over the grid, on either side. With none, there is no row.":
                "Botones pequeños sobre la cuadrícula, a cualquiera de los dos lados. Sin ninguno, no hay fila.",
            "Drag a button onto either side; drag it back here to take it off.":
                "Arrastra un botón a cualquiera de los lados; devuélvelo aquí para quitarlo.",
            "Every button is on the row": "Todos los botones están en la fila",
            "Default layout": "Disposición inicial",
            "Shortcuts": "Atajos",

            "System statistics": "Estadísticas del sistema",
            "Workspace overview": "Vista de espacios",
            "Session menu": "Menú de sesión",
            "Lock the screen": "Bloquear la pantalla",
            "Task board": "Tablero de tareas",
            "Packages": "Paquetes",

            "Toggles": "Conmutadores",
            "Wi-Fi": "Wi-Fi",
            "Power": "Energía",
            "Focus": "Concentración",
            "Microphone": "Micrófono",
            "Camera": "Cámara",
            "Authentication required": "Se necesita autenticación",
            "That password didn't work": "Esa contraseña no ha funcionado",
            "Password": "Contraseña",
            "Authorize": "Autorizar",
            "Caps Lock is on": "Bloq Mayús activado",
            "Machines": "Máquinas",
            "None running": "Ninguna en marcha",
            "running": "en marcha",
            "cores": "núcleos",
            "core": "núcleo",
            "Find a system…": "Busca un sistema…",
            "New": "Nueva",
            "Machines need quickemu, which ./setup packages installs.": "Las máquinas necesitan quickemu, que instala ./setup packages.",
            "No machines yet. Pick a system in New.": "Aún no hay máquinas. Elige un sistema en Nueva.",
            "Downloading": "Descargando",
            "snapshots": "instantáneas",
            "snapshot": "instantánea",
            "Paused": "En pausa",
            "Shutting down": "Apagándose",
            "Running": "En marcha",
            "Cores": "Núcleos",
            "Memory": "Memoria",
            "Take a snapshot": "Hacer una instantánea",
            "Restore %1?": "¿Restaurar %1?",
            "Delete it and its disk": "Borrarla con su disco",
            "Reading the catalogue…": "Leyendo el catálogo…",
            "Version": "Versión",
            "Edition": "Edición",
            "Disk": "Disco",
            "disk": "de disco",
            "Download and create": "Descargar y crear",
            "Systems from quickget": "Sistemas de quickget",
            "Close a machine's window and it keeps running": "Al cerrar la ventana de una máquina, sigue en marcha",
            "Virtual machines": "Máquinas virtuales",
            "Development servers": "Servidores de desarrollo",
            "Screen time": "Tiempo de uso",
            "on average": "sobre la media",
            "Counting from now": "Contando desde ahora",
            "Nothing yet today": "Nada todavía hoy",
            "Today": "Hoy",
            "Yesterday": "Ayer",
            "This week": "Esta semana",
            "Daily average": "Media diaria",
            "Day": "Día",
            "Week": "Semana",
            "Month": "Mes",
            "About your daily average": "Como tu media diaria",
            "more than your daily average": "más que tu media diaria",
            "less than your daily average": "menos que tu media diaria",
            "than last week": "que la semana pasada",
            "than last month": "que el mes pasado",
            "less": "menos",
            "in total": "en total",
            "Screen time counts from now on, while the session is in use. Come back in a while.": "El tiempo de uso se cuenta desde ahora, mientras la sesión está en uso. Vuelve dentro de un rato.",
            "Most used": "Más usadas",
            "Groups": "Grupos",
            "First use": "Primer uso",
            "Total": "Total",
            "Unlocks": "Desbloqueos",
            "from": "de",
            "Longest session": "Sesión más larga",
            "avg": "media",
            "Sessions": "Sesiones",
            "Development": "Desarrollo",
            "Social": "Social",
            "Internet": "Internet",
            "Entertainment": "Entretenimiento",
            "Creativity": "Creatividad",
            "Productivity": "Productividad",
            "Servers": "Servidores",
            "None listening": "Ninguno escuchando",
            "listening": "escuchando",
            "open to the network": "abiertos a la red",
            "this machine": "este equipo",
            "the network too": "también la red",
            "Stopping": "Parando",
            "Start a server inside a project and its port appears here.": "Arranca un servidor dentro de un proyecto y su puerto aparece aquí.",
            "Camera effects": "Efectos de cámara",
            "Effects and reactions for your calls": "Efectos y reacciones para tus llamadas",
            "Off · no program can use it": "Apagada · ningún programa puede usarla",
            "In use by": "En uso por",
            "Pick": "Elige",
            "in any call": "en cualquier llamada",
            "Virtual camera": "Cámara virtual",
            "No camera is plugged in.": "No hay ninguna cámara conectada.",
            "Run ./setup camera once to set the virtual camera up.": "Ejecuta ./setup camera una vez para preparar la cámara virtual.",
            "The virtual camera is off.": "La cámara virtual está apagada.",
            "The camera could not be opened. Another program may be holding it.": "No se pudo abrir la cámara. Puede que otro programa la esté usando.",
            "Waking the camera": "Despertando la cámara",
            "LIVE": "EN DIRECTO",
            "Preview": "Vista previa",
            "face": "cara",
            "faces": "caras",
            "Reactions": "Reacciones",
            "Thumbs up": "Pulgar arriba",
            "Heart": "Corazón",
            "Peace": "Paz",
            "Thumbs down": "Pulgar abajo",
            "Horns": "Cuernos",
            "OK": "OK",
            "Middle finger": "Peineta",
            "Natural": "Natural",
            "Mono": "Blanco y negro",
            "Blur back": "Fondo desenfocado",
            "Centre Stage": "Encuadre centrado",
            "Shades": "Gafas de sol",
            "Crown": "Corona",
            "Sparkle": "Destellos",
            "Photo saved and copied": "Foto guardada y copiada",
            "Photo saved": "Foto guardada",
            "No photo was taken": "No se ha hecho la foto",
            "On the island while one runs": "En la isla mientras haya una en marcha",
            "Airplane": "Modo avión",
            "Output": "Salida",
            "Notch": "Notch",
            "Shadows": "Sombras",
            "Game mode": "Modo juego",
            "Game mode on": "Modo juego activado",
            "Game mode off": "Modo juego desactivado",
            "Everything still, for a game or a slow machine.": "Todo quieto, para jugar o en un equipo lento.",
            "Stops the shell's animations, the spectrum and the pet, makes the island, the dock and the widgets solid without shadows, and turns off Hyprland's animations, blur, shadow and glass. The settings below are kept and come back when it is turned off.":
                "Para las animaciones del shell, el espectro y la mascota, vuelve sólidos y sin sombra la isla, el dock y los widgets, y apaga las animaciones, el desenfoque, la sombra y el cristal de Hyprland. Los ajustes de abajo se conservan y vuelven al desactivarlo.",
            "Capture": "Capturar",
            "Annotate": "Anotar",
            "Read text": "Leer texto",
            "Colour": "Color",
            "Record": "Grabar",
            "Clear clipboard": "Vaciar el portapapeles",

            // ── DOCK ────────────────────────────────────────────────────────
            "The dock": "El dock",
            "The dock is off": "El dock está apagado",
            "Your kept and open applications, on one edge of the screen.":
                "Tus aplicaciones guardadas y las abiertas, en un borde de la pantalla.",
            "An empty dock is not drawn. Icons are reordered by dragging them on the dock itself, and the top edge is left to the bar.":
                "Un dock vacío no se dibuja. Los iconos se reordenan arrastrándolos en el propio dock, y el borde superior queda para la barra.",
            "Show the dock": "Mostrar el dock",
            "Edge": "Borde",
            "Alignment": "Alineación",
            "Icon size": "Tamaño de icono",
            "Magnify on hover": "Ampliar al pasar el ratón",
            "Behaviour": "Comportamiento",
            "The launcher button opens the island's launcher, and open applications appear after a divider while they run. Windows and widgets pass under the dock, so moving or hiding it moves nothing else.":
                "El botón del lanzador abre el lanzador de la isla, y las aplicaciones abiertas aparecen tras un separador mientras están en marcha. Las ventanas y los widgets pasan por debajo del dock, así que moverlo u ocultarlo no mueve nada más.",
            "Launcher button": "Botón del lanzador",
            "Open applications": "Aplicaciones abiertas",
            "On every screen": "En todas las pantallas",
            "Intelligent auto-hide": "Ocultación inteligente",
            "Hides above grid or fullscreen windows, appears on top hover":
                "Se oculta ante ventanas en rejilla o pantalla completa, aparece al pasar el cursor arriba",
            "Always visible": "Siempre visible",
            "Not available with the bezel": "No disponible con el bisel",
            "Zen": "Zen",
            "One on each, all showing the same": "Uno en cada una, todos iguales",
            "Only on the screen you are on": "Solo en la pantalla en la que estás",
            "One on each, and the one you are on is the live one":
                "Una en cada una, y la de tu pantalla es la que funciona",
            "Hide until pointed at": "Ocultar hasta apuntarlo",
            "Kept on it": "Guardadas en él",
            "These stay whether they are running or not, and they lead the launcher's list too.":
                "Estas se quedan estén o no en marcha, y también van delante en la lista del lanzador.",
            "Nothing kept yet.": "Todavía no hay nada guardado.",
            "This application is no longer installed":
                "Esta aplicación ya no está instalada",
            "Add an application": "Añadir una aplicación",
            "New window": "Ventana nueva",
            "Keep in the dock": "Guardar en el dock",
            "Remove from the dock": "Quitar del dock",
            "Close": "Cerrar",
            "Close all windows": "Cerrar todas las ventanas",

            // ── LAUNCHER ────────────────────────────────────────────────────
            "The list": "La lista",
            "What the launcher lists with nothing typed, and how tall it gets.":
                "Lo que muestra el lanzador sin escribir nada, y cuánto crece.",
            "By use ranks applications by launches, with older launches counting for less; those kept on the dock come first until something else is used more. As tall as the answer sizes the island to the results, up to the limit above; off, the box is fixed and the list scrolls.":
                "Por uso ordena las aplicaciones por aperturas, y las antiguas cuentan menos; las guardadas en el dock van primero hasta que otra se use más. Tan alta como la respuesta ajusta la isla a los resultados, hasta el límite de arriba; apagado, la caja es fija y la lista se desplaza.",
            "Order": "Orden",
            "By use": "Por uso",
            "Alphabetical": "Alfabético",
            "Results shown": "Resultados visibles",
            "rows": "filas",
            "As tall as the answer": "Tan alta como la respuesta",
            "Only as tall as it needs": "Solo lo alta que necesite",
            "A fixed box": "Una caja fija",
            "Plain text searches applications, and a sigil in front switches mode. Click one to change it.":
                "El texto normal busca aplicaciones, y un prefijo delante cambia de modo. Haz clic en uno para cambiarlo.",

            "Calculate": "Calcular",
            "Work something out": "Calcula algo",
            "Desk": "Escritorio",
            "Open a panel or an action": "Abre un panel o una acción",
            "Find an open window": "Encuentra una ventana abierta",
            "Start a countdown": "Inicia una cuenta atrás",
            "Note": "Nota",
            "Keep a note": "Guarda una nota",
            "Copy something again": "Vuelve a copiar algo",
            "Emoji": "Emoji",
            "Copy an emoji": "Copia un emoji",
            "Recent": "Recientes",
            "Smileys & Emotion": "Caras y emociones",
            "People & Body": "Personas y cuerpo",
            "Animals & Nature": "Animales y naturaleza",
            "Food & Drink": "Comida y bebida",
            "Travel & Places": "Viajes y lugares",
            "Activities": "Actividades",
            "Objects": "Objetos",
            "Symbols": "Símbolos",
            "Flags": "Banderas",
            "No animated wallpapers yet. Videos in ~/.local/share/wallpapers/animated show up here.":
                "Aún no hay fondos animados. Los vídeos que pongas en ~/.local/share/wallpapers/animated aparecen aquí.",
            "Apps": "Aplicaciones",

            "Clipboard history": "Historial del portapapeles",
            "Everything copied, searchable from the launcher.":
                "Todo lo copiado, con búsqueda desde el lanzador.",
            "Copies from password managers are never stored, and turning the history off stops the watcher entirely. Emptying on lock is off by default, since the lock already protects the session.":
                "Lo copiado desde un gestor de contraseñas no se guarda nunca, y apagar el historial detiene el vigilante por completo. Vaciarlo al bloquear está apagado por defecto, porque el bloqueo ya protege la sesión.",
            "Keep a history": "Guardar un historial",
            "Watching": "Vigilando",
            "Entries kept": "Entradas guardadas",
            "No history is being kept": "No se guarda ningún historial",
            "Keep images": "Guardar imágenes",
            "Pictures as well as text": "Imágenes además de texto",
            "Text only": "Solo texto",
            "Empty it on lock": "Vaciarlo al bloquear",
            "Thrown away on lock": "Se tira al bloquear",
            "Kept across a lock": "Se conserva al bloquear",

            // ── APPEARANCE ──────────────────────────────────────────────────
            "The palette follows the wallpaper, and both are chosen in the island.":
                "La paleta sigue al fondo, y los dos se eligen en la isla.",
            "This opens the island's appearance panel, where wallpapers and palettes are chosen together.":
                "Esto abre el panel de apariencia de la isla, donde se eligen juntos fondos y paletas.",
            "Theme and wallpaper": "Tema y fondo",

            "Transition": "Transición",
            "How the next wallpaper arrives over the last one.":
                "Cómo llega el siguiente fondo sobre el anterior.",
            "Random picks one of the effects above each time a wallpaper is applied.":
                "Aleatorio elige uno de los efectos de arriba cada vez que se aplica un fondo.",
            "Effect": "Efecto",
            "Fade": "Fundido",
            "Wipe": "Barrido",
            "Wave": "Ola",
            "Circle": "Círculo",
            "Outer": "Desde fuera",
            "Random": "Aleatorio",

            "Greeting": "Saludo",
            "The animation shown beside fastfetch when you run fa.":
                "La animación que aparece junto a fastfetch cuando ejecutas fa.",
            "Four pixel-art scenes, redrawn in the current palette whenever it changes. Random picks a new one on every run, and fa with a scene name (fa koi) plays that one.":
                "Cuatro escenas en pixel art, redibujadas con la paleta actual cada vez que cambia. Aleatorio elige una nueva en cada ejecución, y fa con el nombre de una escena (fa koi) muestra esa.",
            "Scene": "Escena",
            "Lava lamp": "Lámpara de lava",
            "Critters": "Bichos",

            "How Hyprland draws every window, this one included.":
                "Cómo dibuja Hyprland cada ventana, esta incluida.",
            "Dwindle splits the space each new window lands in, Master keeps one large window beside a stack, and Scrolling lays windows in a row wider than the screen. The preview below is live and at full size. The border stays at zero because gaps and rounding already separate windows; the inner gap applies to each side of a window, so two windows sit twice that apart.":
                "Dwindle parte el hueco donde cae cada ventana nueva, Master deja una ventana grande junto a una pila y Scrolling pone las ventanas en una fila más ancha que la pantalla. La vista previa de abajo es en vivo y a tamaño real. El borde se queda en cero porque los huecos y el redondeo ya separan las ventanas; el hueco interior se aplica a cada lado de una ventana, así que entre dos queda el doble.",
            "Window rounding": "Redondeo de ventanas",
            "Border width": "Grosor del borde",
            "Inner gap": "Hueco interior",
            "Outer gap": "Hueco exterior",
            "Inactive opacity": "Opacidad inactiva",

            "Depth": "Profundidad",
            "Liquid": "Líquido",
            "Clear frosted glass, lit at the edge": "Cristal esmerilado y claro, con el borde iluminado",
            "Terminal": "Terminal",
            "size": "tamaño",
            "Glass": "Cristal",
            "Needs the refraction plugin — run ./setup plugins":
                "Necesita el plugin de refracción — ejecuta ./setup plugins",
            "Shadow": "Sombra",
            "Lifted off the wallpaper": "Despegadas del fondo",
            "Flat": "Planas",

            "Interface": "Interfaz",
            "Everything Quickshell draws.":
                "Todo lo que dibuja Quickshell.",
            "Monospace": "Monoespaciada",
            "The bar's glyphs and readings, and the terminal.":
                "Los glifos y las lecturas de la barra, y el terminal.",
            "kitty is given the same family, so the terminal and the shell always match. It must be a Nerd Font, or the bar's icons show as empty boxes.":
                "kitty recibe la misma familia, así que el terminal y el shell siempre coinciden. Tiene que ser una Nerd Font, o los iconos de la barra saldrán como cuadros vacíos.",
            "Icons need a Nerd Font patched family.":
                "Los iconos necesitan una fuente parcheada Nerd Font.",

            "The shell": "El shell",
            "The island, its panels, the chips — everything Qt draws.":
                "La isla, sus paneles, las cápsulas — todo lo que dibuja Qt.",
            "Pace": "Ritmo",
            "Smooth": "Suave",
            "Snappy": "Ágil",
            "Springy": "Elástico",
            "How Hyprland animates windows. Reapplied after every reload.":
                "Cómo anima Hyprland las ventanas. Se reaplica tras cada recarga.",
            "Preset": "Preajuste",
            "Glide": "Planeo",
            "Brisk": "Vivo",
            "Calm": "Calma",
            "Bounce": "Rebote",
            "Scales into place and decelerates with a long tail. Quick, and it never bounces.":
                "Escala a su sitio y frena con una cola larga. Rápido, y nunca rebota.",
            "Half the distance and half the time. Movement you register rather than watch.":
                "La mitad de distancia y de tiempo. Movimiento que registras más que miras.",
            "Long and soft, and the screen fades between workspaces rather than sliding.":
                "Largo y suave, y la pantalla funde entre espacios en vez de deslizar.",
            "Overshoots a little and settles back. The look most Hyprland presets are after.":
                "Se pasa un poco y vuelve a asentarse. El aspecto que persiguen la mayoría de preajustes.",
            "Nothing moves. Windows and workspaces appear where they are going to be.":
                "Nada se mueve. Ventanas y espacios aparecen donde van a estar.",

            // ── DISPLAYS ────────────────────────────────────────────────────
            "The screens": "Las pantallas",
            "Drag one to move it, click one to change it.":
                "Arrastra una para moverla, haz clic para cambiarla.",
            "Arrangements are saved per set of connected monitors, identified by the monitor rather than the port, so moving a cable or closing the lid keeps them.":
                "Las disposiciones se guardan por cada conjunto de monitores conectados, identificados por el monitor y no por el puerto, así que cambiar un cable de sitio o cerrar la tapa las conserva.",
            "Every screen shows the primary's": "Todas muestran lo de la principal",
            "Extended across all of them": "Repartido entre todas",
            "Extend": "Extender",
            "Ten for each screen: the main one 1–10, the next 11–20": "Diez por pantalla: la principal 1–10, la siguiente 11–20",
            "Every screen shares the same ten": "Todas las pantallas comparten los mismos diez",
            "Shared": "Compartidos",
            "Per screen": "Por pantalla",
            "Mirror": "Duplicar",
            "The main screen": "La pantalla principal",
            "Where anything with no screen of its own goes, and what mirroring copies.":
                "Donde va lo que no tiene pantalla propia, y lo que duplican las demás.",
            "This arrangement": "Esta disposición",
            "Kept against these screens and no others.":
                "Guardada para estas pantallas y ninguna otra.",
            "Forget it": "Olvidarla",
            "Hands these screens back to Hyprland's own placement":
                "Devuelve estas pantallas a la colocación de Hyprland",
            "Forget": "Olvidar",
            "Which screen": "Qué pantalla",
            "Editing": "Editando",
            "Off — out of the layout, and still plugged in":
                "Apagada — fuera de la disposición, y sigue conectada",
            "Dark — the panel is asleep, and the workspaces are still on it":
                "Oscura — el panel duerme, y sus espacios siguen en ella",
            "The only screen there is": "La única pantalla que hay",
            "Only one screen is plugged in": "Solo hay una pantalla conectada",
            "Only one screen is on": "Solo hay una pantalla encendida",
            "Rounded corners": "Esquinas redondeadas",
            "Every screen's corners curve like the windows": "Las esquinas de cada pantalla se curvan como las ventanas",
            "Square, as the panel is": "Rectas, como el panel",
            "Resolution": "Resolución",
            "What the monitor itself reported, largest first.":
                "Lo que ha reportado el propio monitor, de mayor a menor.",
            "Only the modes the monitor reports are listed. Choosing a resolution selects its highest refresh rate.":
                "Solo aparecen los modos que anuncia el monitor. Al elegir una resolución se usa su frecuencia de refresco más alta.",
            "Refresh rate": "Frecuencia de refresco",
            "The screen is off": "La pantalla está apagada",
            "The only rate at this resolution": "La única frecuencia a esta resolución",
            "Rotation": "Rotación",
            "Variable refresh": "Refresco variable",

            "When the lid closes": "Cuando se cierra la tapa",
            "Only applies with another screen connected.":
                "Solo se aplica con otra pantalla conectada.",
            "With nothing else connected, closing the lid is left to logind, which suspends. With another screen connected, the shell can switch the panel off and move its workspaces to the remaining screen, then bring them back when the lid opens.":
                "Sin nada más conectado, cerrar la tapa lo gestiona logind, que suspende. Con otra pantalla conectada, el shell puede apagar el panel y mover sus espacios a la pantalla que queda, y devolverlos al abrir la tapa.",
            "The laptop's screen": "La pantalla del portátil",
            "Switched off, and its workspaces move over":
                "Se apaga, y sus espacios se mudan",
            "Left on behind the lid": "Se queda encendida tras la tapa",
            "Left to the system": "En manos del sistema",
            "No laptop panel on this machine": "No hay panel de portátil en esta máquina",
            "Switch it off": "Apagarla",
            "Leave it on": "Dejarla encendida",
            "The system decides": "Decide el sistema",

            "Right now": "Ahora mismo",
            "The current state, as the shell detects it.":
                "El estado actual, tal como lo detecta el shell.",
            "The laptop's panel": "El panel del portátil",
            "Not on this machine": "No en esta máquina",
            "%1 — off, and still plugged in": "%1 — apagada, y sigue conectada",
            "%1 — on": "%1 — encendida",
            "Other screens": "Otras pantallas",
            "None — the system handles the lid": "Ninguna — la tapa la gestiona el sistema",

            "Night light": "Luz nocturna",

            // ── INPUT ───────────────────────────────────────────────────────
            "Layouts": "Distribuciones",
            "Loaded in this order; the first is active at login.":
                "Se cargan en este orden; la primera es la activa al iniciar sesión.",
            "Switch between them": "Cambiar entre ellas",
            "Only one layout is loaded": "Solo hay una distribución cargada",
            "Layouts, in order": "Distribuciones, en orden",
            "· the first is the one you start on": "· la primera es con la que empiezas",
            "Search {} layouts": "Busca entre {} distribuciones",
            "Caps Lock": "Bloq Mayús",

            "Typing": "Escritura",
            "How fast a held key repeats, once it has started.":
                "Cuán rápido repite una tecla mantenida, una vez arranca.",
            "Key repeat rate": "Repetición de tecla",

            "Zero is the device's native speed; either side adjusts libinput's acceleration.":
                "Cero es la velocidad nativa del dispositivo; a cada lado se ajusta la aceleración de libinput.",
            "Sensitivity": "Sensibilidad",

            "The cursor": "El cursor",
            "One vector shape, sharp at any size — Palette follows the wallpaper.":
                "Una forma vectorial, nítida a cualquier tamaño — Paleta sigue al fondo.",
            "Colour and size are applied with hyprctl setcursor, so every application updates at once and Palette follows wallpaper changes. Shake to find briefly enlarges the pointer when you shake the mouse; it needs the hypr-dynamic-cursors plugin (./setup plugins).":
                "El color y el tamaño se aplican con hyprctl setcursor, así que todas las aplicaciones cambian a la vez y Paleta sigue los cambios de fondo. Agitar para encontrar agranda el puntero un momento al agitar el ratón; necesita el plugin hypr-dynamic-cursors (./setup plugins).",
            "Cursor colour": "Color del cursor",
            "Cursor size": "Tamaño del cursor",
            "24 px — the default": "24 px — el valor por defecto",
            "Shake to find": "Agitar para encontrar",
            "Needs the cursor plugin — run ./setup plugins":
                "Necesita el plugin del cursor — ejecuta ./setup plugins",
            "Black": "Negro",
            "White": "Blanco",
            "Red": "Rojo",
            "Orange": "Naranja",
            "Yellow": "Amarillo",
            "Green": "Verde",
            "Blue": "Azul",
            "Purple": "Morado",
            "Pink": "Rosa",

            // ── KEYS ────────────────────────────────────────────────────────
            "The shell's own": "Los del shell",
            "Click a combination to change it. Every key here belongs to the profile in use.":
                "Haz clic en una combinación para cambiarla. Cada tecla de aquí es del perfil en uso.",
            "Each profile has its own complete set of keys. A combination already in use is allowed, since Hyprland fires both binds, but the row warns you before you apply it.":
                "Cada perfil tiene su propio juego completo de teclas. Una combinación ya en uso se permite, porque Hyprland dispara los dos atajos, pero la fila te avisa antes de aplicarla.",
            "The compositor's": "Los del compositor",
            "Windows, workspaces, the media keys, the screen off — changed the same way, and kept in the same profile.":
                "Ventanas, espacios, las teclas multimedia, apagar la pantalla — se cambian igual y se guardan en el mismo perfil.",
            "The shell writes these to a file keybinds.lua reads, so applying a change reloads Hyprland. Mouse bindings are shown but cannot be rebound here.":
                "El shell los escribe en un archivo que lee keybinds.lua, así que aplicar un cambio recarga Hyprland. Los atajos del ratón se muestran, pero no se pueden reasignar aquí.",
            "Find a key or an action": "Busca una tecla o una acción",
            "No binding matches that": "Ningún atajo coincide",
            "Utilities": "Utilidades",
            "Other": "Otros",

            "Control centre": "Centro de control",
            "Colour picker": "Selector de color",
            "Capture a region": "Capturar una región",
            "Capture a window": "Capturar una ventana",
            "Capture the screen": "Capturar la pantalla",
            "Capture and annotate": "Capturar y anotar",
            "Read a region": "Leer una región",
            "Record the screen": "Grabar la pantalla",
            "Next module": "Módulo siguiente",
            "Previous module": "Módulo anterior",
            "Clock swap": "Cambiar el reloj",

            "unbound": "sin asignar",
            "Press a key…": "Pulsa una tecla…",
            "Click, then press a key": "Haz clic y pulsa una tecla",
            "Pick the key, and any modifiers to hold with it.":
                "Elige la tecla, y los modificadores que la acompañan.",
            "is already": "ya es",
            "Both would fire.": "Dispararían las dos.",

            // ── SESSION ─────────────────────────────────────────────────────
            "You": "Tú",
            "Picture": "Foto",
            "Click it, or drop an image here": "Haz clic, o suelta una imagen aquí",
            "Choose a picture": "Elige una foto",
            "Name": "Nombre",

            "Just enough to make the text underneath unreadable.":
                "Lo justo para que el texto de debajo no se pueda leer.",
            "The preview uses the wallpaper, since the lock screen's own capture is taken when it locks. It applies the same blur with the capsule on top, so you can judge how it reads.":
                "La vista previa usa el fondo, porque la captura de la pantalla de bloqueo se toma al bloquear. Aplica el mismo desenfoque con la cápsula encima, para que veas cómo se lee.",
            "No wallpaper to show": "No hay fondo que mostrar",
            "The login screen always draws it stacked.":
                "La pantalla de inicio siempre lo dibuja apilado.",
            "The login screen runs before anyone has signed in, so it cannot read your settings.":
                "La pantalla de inicio aparece antes de que nadie haya entrado, así que no puede leer tus ajustes.",
            "Stacked": "Apilado",
            "Inline": "En línea",
            "Type to unlock": "Escribe para desbloquear",

            "When you leave it alone": "Cuando lo dejas quieto",
            "All three are off by default.":
                "Los tres están desactivados por defecto.",
            "The shell uses the compositor's idle notifications, and media that inhibits idle (mpv, browsers) holds all three off. Set screen off after the lock, since the lock captures the screen as it starts; suspend always locks first and is skipped if the lock does not come up.":
                "El shell usa las notificaciones de inactividad del compositor, y lo que impide la inactividad (mpv, navegadores) frena los tres. Pon el apagado de pantalla después del bloqueo, porque el bloqueo captura la pantalla al activarse; suspender siempre bloquea antes, y no suspende si el bloqueo no llega a activarse.",
            "Never": "Nunca",
            "Lock after": "Bloquear tras",
            "Screen off after": "Apagar la pantalla tras",
            "before the lock": "antes del bloqueo",
            "Suspend after": "Suspender tras",

            // ── SYSTEM ──────────────────────────────────────────────────────
            "Changes are saved to the profile in use as you make them.":
                "Los cambios se guardan en el perfil en uso a medida que los haces.",
            "A profile holds the bar, widgets, dock, launcher, control centre, look, keys and wallpaper with its palette. Screens, your name and picture, language, weather location, GitHub user, Do not disturb and night light stay with the machine, and notes, tasks and clipboard are shared by every profile.":
                "Un perfil guarda la barra, los widgets, el dock, el lanzador, el centro de control, el aspecto, las teclas y el fondo con su paleta. Las pantallas, tu nombre y foto, el idioma, la ubicación del tiempo, el usuario de GitHub, No molestar y la luz nocturna se quedan con la máquina, y las notas, las tareas y el portapapeles son comunes a todos los perfiles.",
            "Profile": "Perfil",
            "New profile": "Perfil nuevo",
            "Import…": "Importar…",
            "In use": "En uso",
            "Switch": "Cambiar",
            "Delete": "Borrar",
            "Keep": "Conservar",
            "Rename": "Renombrar",
            "Duplicate": "Duplicar",
            "Export to a file…": "Exportar a un archivo…",
            "Export the profile": "Exportar el perfil",
            "Import a profile": "Importar un perfil",
            "Profiles (*.json)": "Perfiles (*.json)",
            "Deleted for good — there is no undo": "Se borra para siempre — no hay deshacer",
            "Enter to keep the name · Esc to leave it": "Intro para guardar el nombre · Esc para dejarlo",
            "Grouped bar": "Barra agrupada",
            "Spread bar": "Barra repartida",
            "dock at the bottom": "dock abajo",
            "dock on the left": "dock a la izquierda",
            "dock on the right": "dock a la derecha",
            "no dock": "sin dock",
            "nothing on the desk": "nada en el escritorio",
            "widget": "widget",
            "widgets": "widgets",

            "This window": "Esta ventana",
            "The language of this window.":
                "El idioma de esta ventana.",
            "Only the settings window is translated, and anything without a translation appears in English. Files the shell writes, such as generated themes, are always in English.":
                "Solo se traduce la ventana de ajustes, y lo que no tenga traducción aparece en inglés. Los archivos que escribe el shell, como los temas generados, van siempre en inglés.",
            "Language": "Idioma",

            "This machine": "Esta máquina",
            "PROCESSOR": "PROCESADOR",
            "MEMORY": "MEMORIA",
            "UPTIME": "ENCENDIDO",
            "VERSION": "VERSIÓN",
            "edited": "editado",
            "threads": "hilos",
            "% in use": "% en uso",
            "since boot": "desde el arranque",

            "impasto itself, not the packages it runs.":
                "impasto en sí, no los paquetes que usa.",
            "Update pulls the checkout impasto was installed from and runs the installer again in a terminal, where its questions and your password stay visible.":
                "Actualizar descarga el repositorio del que se instaló impasto y vuelve a ejecutar el instalador en una terminal, donde se ven sus preguntas y tu contraseña.",
            "Check for updates": "Buscar actualizaciones",
            "Check": "Buscar",
            "Checking…": "Buscando…",
            "Not checked yet": "Sin comprobar todavía",
            "The remote did not answer": "El remoto no respondió",
            "Up to date": "Al día",
            "checked at": "comprobado a las",
            "commit waiting": "commit esperando",
            "commits waiting": "commits esperando",
            "Update": "Actualizar",
            "To": "A",
            "Commits of your own are not on the remote":
                "Tienes commits que no están en el remoto",
            "No checkout to update from": "No hay repositorio del que actualizar",
            "No remote to compare with": "Sin remoto con el que comparar",
            "WHAT IS WAITING": "LO QUE ESPERA",
            "more": "más",

            "Changed files": "Archivos cambiados",
            "impasto's own files, as you left them.":
                "Los archivos de impasto, tal como los dejaste.",
            "Updates leave a file you deleted deleted, and a file you edited as you edited it, with any newer version beside it as .new. Restore puts impasto's version back; yours, if there was one, is kept in ~/.local/state/impasto/backups.":
                "Las actualizaciones no vuelven a poner un archivo que borraste, ni tocan uno que editaste: si hay una versión nueva, la dejan al lado como .new. Restaurar vuelve a poner la versión de impasto; la tuya, si la había, se guarda en ~/.local/state/impasto/backups.",
            "No checkout to restore from": "No hay repositorio del que restaurar",
            "Every file as installed": "Todo como se instaló",
            "file edited": "archivo editado",
            "files edited": "archivos editados",
            "file deleted": "archivo borrado",
            "files deleted": "archivos borrados",
            "Restore all": "Restaurar todo",
            "Restore": "Restaurar",
            "DELETED": "BORRADOS",
            "EDITED": "EDITADOS",
            "files": "archivos",
            "newer version waiting": "hay una versión nueva",
            "Keep mine": "Quedarme la mía",
            "Use the new one": "Usar la nueva",
            "Show all": "Ver los",
            "Show fewer": "Ver menos",

            "Face unlock": "Desbloqueo facial",
            "The lock screen only, with the infrared camera.":
                "Solo en la pantalla de bloqueo, con la cámara de infrarrojos.",
            "howdy keeps the faces where only root can read them, so adding or removing one asks for your password. The login screen, sudo and polkit still ask for the password.":
                "howdy guarda las caras donde solo root puede leerlas, así que añadir o quitar una pide tu contraseña. La pantalla de inicio de sesión, sudo y polkit siguen pidiendo la contraseña.",
            "Needs an infrared camera": "Necesita una cámara de infrarrojos",
            "Set up": "Configurar",
            "Finish setting up": "Terminar de configurar",
            "Add a face": "Añadir una cara",
            "Confirm with your password, then look at the camera":
                "Confirma con tu contraseña y mira a la cámara",
            "FACES": "CARAS",
            "Try it": "Probar",
            "Try": "Probar",
            "Looking…": "Mirando…",
            "Recognised": "Reconocida",
            "Not recognised": "No reconocida",
            "Not set up": "Sin configurar",
            "Half set up": "A medio configurar",
            "Adding a face…": "Añadiendo una cara…",
            "Removing…": "Quitando…",
            "Face added": "Cara añadida",
            "No face seen — try with more light": "No se vio ninguna cara: prueba con más luz",
            "More than one face in view": "Hay más de una cara a la vista",
            "Too dark for the camera": "Demasiado oscuro para la cámara",
            "The face was not added": "No se añadió la cara",
            "No face yet": "Ninguna cara todavía",
            "Face %1": "Cara %1",
            "%1 face": "%1 cara",
            "%1 faces": "%1 caras",

            "Your account's name and picture, on the lock and login screens.":
                "El nombre y la foto de tu cuenta, en la pantalla de bloqueo y en la de inicio de sesión.",
            "The name is your account's full name, and the picture is kept where the login screen reads it too, made square. Click the picture or drop an image on the card to change it.":
                "El nombre es el nombre completo de tu cuenta, y la foto se guarda, recortada en cuadrado, donde también la lee la pantalla de inicio de sesión. Haz clic en la foto o suelta una imagen en la tarjeta para cambiarla.",
            "Saving…": "Guardando…",
            "The picture was not changed": "La foto no se cambió",
            "The lock screen only, until ./setup system": "Solo en el bloqueo, hasta ./setup system",
            "On the lock and login screens": "En el bloqueo y en el inicio de sesión",

            "Only the profile in use. The others are left as they were.":
                "Solo el perfil en uso. Los demás se quedan como estaban.",
            "Reset returns every setting in this profile to its default, clears the compositor overrides and reloads Hyprland. Machine settings such as screens, name, picture and language are kept, and there is no undo.":
                "Restablecer devuelve cada ajuste de este perfil a su valor por defecto, borra los cambios aplicados al compositor y recarga Hyprland. Los ajustes de la máquina, como las pantallas, el nombre, la foto y el idioma, se conservan, y no se puede deshacer.",
            "Where the settings live": "Dónde viven los ajustes",
            "Reset this profile": "Restablecer este perfil",
            "Back to the defaults": "Volver a los valores por defecto",
            "A Hyprland shell, and the desk around it":
                "Un shell para Hyprland, y el escritorio alrededor",

            "A notch cuts the island into the top edge, and the bar's top margin no longer applies to it.":
                "Una muesca encaja la isla en el borde superior, y el margen superior de la barra deja de aplicarse a ella.",
            "Animation": "Animación",
            "Bar": "Barra",
            "Classic is solid black, Glass the accent-tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane. Its typeface is the monospace one, under Type.":
                "Clásico es negro sólido, Cristal el fondo teñido del acento sobre el fondo de pantalla desenfocado, y Líquido un panel esmerilado transparente. Su tipografía es la monoespaciada, en Tipografía.",
            "Classic is solid black, Glass the terminal's tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane that lets the wallpaper's own colours through. The island is always the bar's.":
                "Clásico es negro sólido, Cristal el fondo teñido del terminal sobre el fondo de pantalla desenfocado, y Líquido un panel esmerilado transparente que deja pasar los colores del fondo de pantalla. La isla siempre es como la barra.",
            "Classic is solid black, Glass the terminal's tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane. Background sets how opaque the capsule is; lower it to let the blurred wallpaper through.":
                "Clásico es negro sólido, Cristal el fondo teñido del terminal sobre el fondo de pantalla desenfocado, y Líquido un panel esmerilado transparente. Fondo ajusta la opacidad de la cápsula; bájalo para que se vea el fondo de pantalla desenfocado.",
            "How Hyprland lays out, draws and animates windows.":
                "Cómo Hyprland coloca, dibuja y anima las ventanas.",
            "How the bar is drawn round the island.":
                "Cómo se dibuja la barra alrededor de la isla.",
            "How the top bar is drawn, what it carries and its workspaces.":
                "Cómo se dibuja la barra superior, qué lleva y sus espacios de trabajo.",
            "Inactive opacity fades the windows without focus. Blur shows behind anything translucent, such as the terminal. Refraction (a Hyprland plugin, tuned in look.lua) frosts and bends what is behind a window, like wet glass.":
                "La opacidad inactiva atenúa las ventanas sin foco. El desenfoque se ve detrás de todo lo translúcido, como el terminal. La refracción (un plugin de Hyprland, ajustado en look.lua) esmerila y curva lo que hay detrás de una ventana, como cristal mojado.",
            "Look them up": "Buscarlas",
            "Looked up on lrclib.net by title and artist, which needs no account. They show in the island's glance and its media card, in the desktop's lyrics widget and on the lock screen when it is set to show them.":
                "Se buscan en lrclib.net por título y artista, sin necesidad de cuenta. Aparecen en el vistazo de la isla y en su tarjeta de música, en el widget de letras del escritorio y en la pantalla de bloqueo cuando está configurada para mostrarlas.",
            "Notes on the edges": "Notas en los bordes",
            "Position": "Posición",
            "Profiles, updates, language and this machine.":
                "Perfiles, actualizaciones, idioma y este equipo.",
            "The icon size everything on the dock scales with, and what the capsule is made of.":
                "El tamaño de icono con el que escala todo el dock, y de qué está hecha la cápsula.",
            "The island at rest, what runs beside the time, and notifications.":
                "La isla en reposo, lo que corre junto a la hora, y las notificaciones.",
            "The lyrics follow the Lyrics switch on the Modules page, and are looked up on lrclib.net.":
                "Las letras siguen el interruptor Letras de la página Módulos, y se buscan en lrclib.net.",
            "The notes stuck on the screen's edges and the spectrum's bars leave when a window opens and come back when the last one closes; the spectrum stops listening meanwhile. Off, the notes stay over the windows and the bars under them.":
                "Las notas pegadas en los bordes de la pantalla y las barras del espectro se van cuando se abre una ventana y vuelven cuando se cierra la última; mientras tanto el espectro deja de escuchar. Desactivado, las notas se quedan sobre las ventanas y las barras debajo.",
            "The style keeps what is on the bar and only changes how it is drawn: grouped round the island, spread to the two edges, all inside one capsule, or a bezel across the top edge. What each side carries is arranged in Layout. Rounded corners round every screen, and curve under the bezel's ends.":
                "El estilo mantiene lo que hay en la barra y solo cambia cómo se dibuja: agrupada alrededor de la isla, repartida hacia los dos bordes, todo dentro de una cápsula, o un marco a lo largo del borde superior. Lo que lleva cada lado se coloca en Disposición. Las esquinas redondeadas redondean cada pantalla y se curvan bajo los extremos del marco.",
            "The words of whatever is playing, wherever they are shown.":
                "La letra de lo que suena, allí donde se muestre.",
            "Their order is set by dragging them on the dock, and right-clicking a dock icon also keeps or removes it. The launcher puts them first, so the list stays editable with the dock off.":
                "Su orden se cambia arrastrándolas en el dock, y el clic derecho sobre un icono del dock también la guarda o la quita. El lanzador las pone primero, así que la lista sigue editable con el dock apagado.",
            "Wallpaper, terminal, fonts and the shell's motion.":
                "Fondo de pantalla, terminal, tipografías y el movimiento del shell.",
            "What else the dock shows, and when it hides.":
                "Qué más muestra el dock, y cuándo se oculta.",
            "What kitty's window is made of.": "De qué está hecha la ventana de kitty.",
            "What makes way when a window opens on the workspace.":
                "Lo que se aparta cuando se abre una ventana en el espacio de trabajo.",
            "What shows through a window, and what lifts it off the wallpaper.":
                "Lo que se ve a través de una ventana, y lo que la despega del fondo de pantalla.",
            "What the bar and the island are made of.":
                "De qué están hechas la barra y la isla.",
            "What the modules know, on the bar, the desktop and the panels.":
                "Lo que saben los módulos, en la barra, el escritorio y los paneles.",
            "Where the island meets the top edge, and what opens it.":
                "Dónde se encuentra la isla con el borde superior, y qué la abre.",
            "While arranging, click a widget to override these for it alone. Modern shows a figure with a caption, Analogue draws an object such as a dial or a gauge, and Sticker cuts it out as coloured stickers on the wallpaper; the ground and the background set what the first two are made of and how opaque.":
                "Al colocar, haz clic en un widget para cambiar esto solo para él. Moderno muestra una cifra con un rótulo, Analógico dibuja un objeto como una esfera o un indicador, y Pegatina lo recorta como pegatinas de colores sobre el fondo de pantalla; el material y el fondo deciden de qué están hechos los dos primeros y su opacidad.",
            "With more screens": "Con más pantallas",
            "Your account, the lock screen, face unlock and idle behaviour.":
                "Tu cuenta, la pantalla de bloqueo, el desbloqueo facial y la inactividad.",
            "Autostart": "Inicio automático",
            "Startup Applications": "Aplicaciones de inicio",
            "Applications and scripts launched automatically when you log in.":
                "Aplicaciones y comandos iniciados automáticamente al iniciar sesión.",
            "Assign each application to a specific workspace and display, so your desktop is arranged the moment you start.":
                "Asigne cada aplicación a un espacio de trabajo y pantalla para organizar su escritorio al iniciar.",
            "No startup applications yet.": "No hay aplicaciones de inicio todavía.",
            "Any display": "Cualquier pantalla",
            "Launch now": "Iniciar ahora",
            "Launch all": "Iniciar todos",
            "Test startup": "Probar inicio",
            "Launch all enabled applications now": "Ejecuta todas las aplicaciones activadas ahora.",
            "Add command": "Añadir comando",
            "Command or script to run": "Comando o script a ejecutar",
            "Application name": "Nombre de la aplicación",
            "Pick an installed application or enter a custom command.":
                "Elija una aplicación instalada o introduzca un comando personalizado."
        },
        pt: {
            // ── SHARED ──────────────────────────────────────────────────────
            "Search settings": "Buscar configurações",
            "Reset": "Restaurar",
            "Open": "Abrir",
            "Clear": "Limpar",
            "Edit": "Editar",
            "Done": "Concluído",
            "Cancel": "Cancelar",
            "Apply": "Aplicar",
            "Remove": "Remover",
            "Size": "Tamanho",
            "Scale": "Escala",
            "Shape": "Formato",
            "Shown": "Visível",
            "Hidden": "Oculto",
            "None": "Nenhum",
            "Off": "Desativado",
            "On": "Ativado",
            "Default": "Padrão",
            "default": "padrão",
            "Custom": "Personalizado",
            "Left": "Esquerda",
            "Right": "Direita",
            "Bottom": "Inferior",
            "Start": "Iniciar",
            "Middle": "Meio",
            "End": "Fim",
            "Applications": "Aplicativos",
            "Search applications": "Buscar aplicativos",
            "Windows": "Janelas",
            "Window": "Janela",
            "Screen": "Tela",
            "Region": "Região",
            "Workspaces": "Espaços de trabalho",
            "Tray": "Bandeja",
            "Privacy": "Privacidade",
            "Sound": "Som",
            "%1 screens": "%1 telas",
            "Screens": "Telas",
            "Warmth": "Temperatura da cor",
            "Presets": "Predefinições",
            "Candle": "Vela",
            "Warm": "Quente",
            "Soft": "Suave",
            "Neutral": "Neutra",
            "Recording": "Gravando",
            "What uses the microphone, camera or screen": "O que está usando o microfone, a câmera ou a tela",
            "Not shown": "Não exibido",
            "now": "agora",
            "Theme": "Tema",
            "Face": "Visual",
            "Style": "Estilo",
            "Palette": "Paleta",
            "Settings": "Configurações",
            "Wallpaper": "Papel de parede",
            "Blur": "Desfoque",
            "Background": "Fundo",
            "Arrangement": "Disposição",

            // ── THE PANEL ───────────────────────────────────────────────────
            "THE SHELL": "O SHELL",
            "THE DESK": "A ÁREA DE TRABALHO",
            "THE SESSION": "A SESSÃO",

            "Modules": "Módulos",
            "Desktop": "Área de Trabalho",
            "What sits on the wallpaper, under the windows.":
                "O que fica sobre o papel de parede, sob as janelas.",
            "Control Centre": "Central de Controle",
            "What the island opens onto when you click it.":
                "O que a ilha abre quando você clica nela.",
            "Dock": "Dock",
            "The dock and the applications kept on it.":
                "A dock e os aplicativos fixados nela.",
            "Launcher": "Inicializador",
            "Search, sigils and the clipboard history.":
                "Busca, comandos e histórico da área de transferência.",
            "Results": "Resultados",
            "Sigils": "Comandos",
            "Clipboard": "Área de transferência",
            "Appearance": "Aparência",
            "Type": "Tipografia",
            "Motion": "Animações",
            "Displays": "Monitores",
            "Screen layout, modes and the laptop lid.":
                "Disposição e modos das telas, e a tampa do notebook.",
            "The screen": "A tela",
            "The lid": "A tampa",
            "Input": "Entrada",
            "The keyboard, the pointer and the cursor.":
                "O teclado, o ponteiro e o cursor.",
            "Keyboard": "Teclado",
            "Pointer": "Ponteiro",
            "Keys": "Atalhos",
            "Every keybinding, the shell's and Hyprland's.":
                "Todos os atalhos de teclado, do shell e do Hyprland.",
            "Session": "Sessão",
            "Lock screen": "Tela de bloqueio",
            "Lock": "Bloquear",
            "Suspend": "Suspender",
            "Log out": "Encerrar sessão",
            "Restart": "Reiniciar",
            "Shut down": "Desligar",
            "When you leave": "Ao se ausentar",
            "System": "Sistema",
            "Profiles": "Perfis",

            // ── BAR & ISLAND ────────────────────────────────────────────────
            "The island": "A ilha",
            "Island": "Ilha",
            "Grouped": "Agrupada",
            "Spread": "Espalhada",
            "The workspaces, the island and the modules together in the middle.":
                "Os espaços, a ilha e os módulos juntos no centro.",
            "The workspaces at one edge, the modules at the other, the island between them.":
                "Os espaços em uma borda, os módulos na outra e a ilha entre eles.",
            "Everything inside a single capsule.": "Tudo dentro de uma única cápsula.",
            "A band across the whole top edge, with the island dropping out of its middle.":
                "Uma faixa ao longo de toda a borda superior, com a ilha descendo do centro.",
            "Bezel": "Moldura",
            "The bezel is always cut into the top edge": "A moldura é sempre encaixada na borda superior",
            "A glance on hover": "Uma visão rápida ao passar o mouse",
            "Resting the pointer on the island opens it": "Repousar o ponteiro sobre a ilha a expande",
            "Only a click opens anything": "Apenas um clique abre algo",
            "Lyrics": "Letras",
            "The playing track's lyrics are looked up on lrclib.net": "A letra da música em reprodução é buscada no lrclib.net",
            "No lyrics, and nothing is looked up": "Sem letras, e nenhuma busca é feita",
            "Instrumental": "Instrumental",
            "Lyrics are off": "Letras desativadas",
            "Nothing playing": "Nada em reprodução",
            "Looking for lyrics": "Buscando letras",
            "No lyrics for this one": "Sem letra para esta música",
            "Lyrics, untimed": "Letra sem sincronização",
            "A region": "Uma região",
            "A window": "Uma janela",
            "Flip": "Virar",
            "Music": "Música",
            "Only while something is playing.": "Apenas enquanto algo estiver tocando.",
            "Show": "Exibir",
            "Nothing": "Nada",
            "The player": "O reprodutor",
            "With lyrics": "Com letra",
            "Behind it": "Atrás",
            "The cover": "A capa",
            "Muted": "Silenciado",
            "Cut into the top edge": "Recortado na borda superior",
            "Floating below the top edge": "Flutuando sob a borda superior",
            "Floating": "Flutuante",
            "One island": "Uma ilha",
            "Edge to edge": "De ponta a ponta",
            "The bar itself is the preview: it repaints over this window as the sliders move.":
                "A própria barra é a prévia: ela se redesenha sobre esta janela conforme você move os controles.",
            "Everything on the bar scales with its height. The top margin is the gap to the screen edge (the island ignores it in notch mode), and the side margin is the inset from the left and right edges.":
                "Tudo na barra escala com a sua altura. A margem superior é o espaço até a borda da tela (a ilha a ignora no modo notch), e a margem lateral é o recuo das bordas esquerda e direita.",
            "Bar height": "Altura da barra",
            "Top margin": "Margem superior",
            "Side margin": "Margem lateral",
            "The shown workspaces are always drawn; the rest, up to the available count, appear only while they have windows.":
                "Os espaços visíveis são sempre desenhados; os restantes, até o limite disponível, aparecem apenas enquanto contiverem janelas.",
            "Workspaces shown": "Espaços exibidos",
            "Workspaces available": "Espaços disponíveis",

            "Notifications": "Notificações",
            "New notifications appear briefly in the island.":
                "Novas notificações surgem brevemente na ilha.",
            "The shell is the notification daemon: notifications without their own timeout use the time below, and critical ones stay until dismissed. Do not disturb only keeps them off the screen; they still collect in the control centre until the shell restarts.":
                "O shell é o daemon de notificações: notificações sem tempo limite próprio usam o tempo abaixo, e notificações críticas permanecem até serem dispensadas. O Não perturbe apenas as impede de aparecer na tela; elas continuam acumuladas na central de controle até o shell reiniciar.",
            "How long one stays": "Duração de exibição",
            "Nothing is shown while Do not disturb is on":
                "Nada é exibido enquanto o Não perturbe estiver ativado",
            "Do not disturb": "Não perturbe",
            "Nothing takes the screen": "Nada ocupa a tela inteira",
            "Everything is shown": "Tudo é exibido",
            "Kept": "Salvos",
            "in this session": "nesta sessão",
            "Nothing kept": "Nada salvo",

            // ── BAR & ISLAND · THE TIME ─────────────────────────────────────
            "The time": "A hora",
            "Beside the time": "Ao lado da hora",
            "Shown on the resting island, and larger in the glance.":
                "Exibido na ilha em repouso, e maior na visão rápida.",
            "What is running sits either side of the time, two at most.":
                "O que está em execução fica nos lados da hora, no máximo dois.",
            "A recording is always there and comes first; click its dot to stop it. Then the microphone, camera or screen in use, a countdown and media, which still work from their chips on the bar when kept off the island. The workspace comes last, for a bar without the strip; click it for the overview.":
                "Uma gravação sempre fica visível e tem prioridade; clique no ponto para interromper. Em seguida, microfone, câmera ou tela em uso, contagem regressiva e mídia, que continuam funcionando nos chips da barra mesmo fora da ilha. O espaço de trabalho vem por último, para uma barra sem a faixa de espaços; clique nele para a visão geral.",
            "Workspace": "Espaço de trabalho",
            "The one you are on": "O espaço ativo no momento",
            "On the island while it runs": "Na ilha enquanto estiver em execução",
            "Only where its chip is put": "Apenas onde o seu elemento for colocado",

            // ── BAR & ISLAND · MODULES ──────────────────────────────────────
            "Chips": "Elementos",
            "Every piece on the bar follows these unless it was given its own.":
                "Todos os elementos da barra seguem isso, a menos que tenham ajuste próprio.",
            "Like the bar": "Como a barra",
            "When": "Quando",
            "The bar": "A barra",
            "While it runs": "Enquanto estiver em execução",
            "Nothing to set: it is drawn one way.": "Nada a configurar: é desenhado de uma única forma.",
            "Rings": "Anéis",
            "Numbers": "Números",
            "Roman": "Romanos",
            "Kanji": "Kanji",
            "Greek": "Grego",
            "Icon shows the module's symbol; Ring draws the gauge of a module that measures something (charge, volume, a countdown) as a circle around it, and the rest keep their symbol. The figure is the value itself, and On hover shows it only while the pointer is over the chip.":
                "Ícone mostra o símbolo do módulo; Anel desenha o medidor de módulos que medem algo (bateria, volume, contagem regressiva) como um círculo ao redor, e os demais mantêm seu símbolo. O valor é o número em si, e Ao passar o mouse só exibe enquanto o cursor estiver sobre o elemento.",
            "Icon": "Ícone",
            "Ring": "Anel",
            "The symbol alone, small.": "Apenas o símbolo, pequeno.",
            "The gauge, in a circle.": "O medidor, em um círculo.",
            "Figure": "Valor",
            "No": "Não",
            "On hover": "Ao passar o mouse",
            "Always": "Sempre",
            "No figure beside it": "Sem valor ao lado",
            "The figure opens under the pointer": "O valor surge sob o cursor",
            "The figure always beside it": "O valor sempre visível ao lado",
            "Layout": "Disposição",
            "Drag a piece from the catalogue onto the bar.":
                "Arraste um elemento do catálogo para a barra.",
            "Drop a piece on either half of the bar to place it on that side of the island; drag it along to move it or off the bar to remove it, and click it to give it its own shape and figure. Adjacent modules share a capsule, and a split starts a new one.":
                "Solte um elemento em uma metade da barra para colocá-lo naquele lado da ilha; arraste para reposicionar ou para fora da barra para remover, e clique para definir formato e valor próprios. Módulos adjacentes compartilham a cápsula, e um separador inicia outra.",
            "Empty": "Vazio",
            "Search": "Buscar",
            "Overview": "Visão Geral",
            "Split": "Separador",

            "Media": "Mídia",
            "Timer": "Temporizador",
            "Battery": "Bateria",
            "Volume": "Volume",
            "Brightness": "Brilho",
            "Network": "Rede",
            "Weather": "Clima",
            "Markets": "Mercados",
            "Updates": "Atualizações",
            "Pet": "Mascote",
            "Spectrum": "Espectro",
            "Under the windows": "Sob as janelas",
            "Fill": "Preenchimento",
            "From the edge": "A partir da borda",
            "To the tip": "Até a ponta",
            "Height": "Altura",
            "Bars": "Barras",
            "Gap": "Espaço",
            "Lows": "Graves",
            "At the corners": "Nos cantos",
            "Peaks": "Picos",
            "Rounded columns": "Colunas arredondadas",
            "Square columns": "Colunas retas",
            "Segments": "Segmentos",
            "Dots": "Pontos",
            "Fading to the tip": "Desvanecendo até a ponta",
            "Solid": "Sólido",
            "Two colours": "Duas cores",
            "Games": "Jogos",
            "Calendar": "Calendário",
            "Notes": "Notas",
            "Tasks": "Tarefas",
            "Clock": "Relógio",
            "Photo": "Foto",

            // ── BAR & ISLAND · WHAT A MODULE KNOWS ──────────────────────────
            "Seconds make the clock repaint sixty times as often.":
                "Os segundos fazem o relógio repintar sessenta vezes mais frequentemente.",
            "Clock format": "Formato do relógio",
            "24-hour": "24 horas",
            "12-hour": "12 horas",
            "Show the date": "Exibir a data",
            "The time alone": "Apenas a hora",
            "Show seconds": "Exibir segundos",

            "Left empty, wttr.in guesses from your connection's IP address, which can be far off. A city, postcode or airport code is more reliable, and the bar uses the same place.":
                "Se deixado em branco, o wttr.in tenta adivinhar pelo IP da sua conexão, o que pode errar bastante. Uma cidade, CEP ou código de aeroporto é mais confiável, e a barra usa o mesmo local.",
            "Location": "Localização",
            "A city, a postcode or an airport code.":
                "Uma cidade, CEP ou código de aeroporto.",
            "Wherever the request comes from": "De onde vier a requisição",
            "No such place — the last reading is still showing":
                "Local não encontrado, exibindo a última leitura",

            "The graph is read from the public profile page, so no token or account is needed. It stays empty until you enter a username.":
                "O gráfico é lido da página pública do perfil, dispensando token ou conta. Permanece vazio até que você insira um nome de usuário.",
            "Username": "Nome de usuário",
            "Whose public contribution graph to draw.":
                "De quem exibir o gráfico público de contribuições.",
            "Nobody yet": "Ninguém ainda",
            "No such profile — the last grid is still showing":
                "Perfil não encontrado, exibindo a última grade",

            "The coins and currencies to follow, separated by commas.":
                "Moedas e moedas fiduciárias a acompanhar, separadas por vírgula.",
            "A coin alone is priced in US dollars and BTC/EUR in euros; two currencies, such as EUR/USD, follow the European Central Bank's daily rate. Prices come from CoinGecko and Frankfurter, which see what you follow but need no account. The bar shows the first one.":
                "Uma criptomoeda avulsa é cotada em dólares americanos e BTC/EUR em euros; duas moedas, como EUR/USD, seguem a cotação diária do Banco Central Europeu. Os preços vêm da CoinGecko e Frankfurter, sem necessidade de conta. A barra exibe a primeira.",
            "Follow": "Acompanhar",
            "Not found:": "Não encontrado:",

            "A note on the wallpaper is written the same way as one in the panel.":
                "Uma nota no papel de parede é escrita da mesma forma que uma no painel.",
            "Handwriting": "Manuscrito",
            "The signature's script": "A letra da assinatura",
            "The interface face": "A fonte da interface",
            "Gone while a window is open": "Oculto enquanto houver janela aberta",
            "Over the windows": "Sobre as janelas",

            "How the creature is drawn, wherever it is drawn.":
                "Como a criatura é desenhada, onde quer que apareça.",
            "The species decides the colour and what the creature is; the style decides how it is drawn. The same drawing is used on the bar, in the pet's panel and on the desktop.":
                "A espécie define a cor e qual é a criatura; o estilo define como é desenhada. O mesmo desenho é usado na barra, no painel do mascote e na área de trabalho.",
            "Creature": "Criatura",
            "A different animal for each species.":
                "Um animal diferente para cada espécie.",
            "Plush": "Pelúcia",
            "One round body, shaded.": "Corpo arredondado, com sombreamento.",
            "Paper": "Papel",
            "Flat, cut from two tones.": "Plano, recortado em dois tons.",
            "Pixel": "Pixel",
            "A sprite, sixteen cells across.":
                "Um sprite com dezesseis células de largura.",

            "Unhatched — care for it and see": "No ovo, cuide dele para ver",
            "Bring out": "Colocar para fora",
            "Out": "Fora",
            "The next egg": "O próximo ovo",
            "Levels across the family": "Níveis em toda a família",
            "All five found": "Todos os cinco encontrados",
            "Nothing left to find — there is a star waiting at level fifteen for each of them.":
                "Nada restante para encontrar, há uma estrela aguardando no nível quinze para cada um deles.",

            // ── DESKTOP ─────────────────────────────────────────────────────
            "The desktop": "A área de trabalho",
            "Widgets are arranged directly on the wallpaper.":
                "Widgets são posicionados diretamente sobre o papel de parede.",
            "Arranging brings the widgets in front of the windows, with a card of every module, moved by the space between them. Drag one onto the grid, pull a widget's corner to change its shape, click it for a look of its own, and drop it back on the card to take it off. Escape or the right button ends it, and the right button on any widget opens the same mode from the picture. This window closes meanwhile.":
                "O modo de organização traz os widgets à frente das janelas, com um cartão de todos os módulos. Arraste um para a grade, puxe a quina de um widget para redimensionar, clique para definir um visual próprio e solte-o no cartão para removê-lo. Esc ou botão direito finaliza, e o botão direito em qualquer widget abre esse mesmo modo. Esta janela se fechará durante a edição.",
            "Arrange the desktop": "Organizar área de trabalho",
            "Arrange widgets": "Organizar widgets",
            "on the wallpaper": "no papel de parede",
            "Nothing on the wallpaper yet": "Nada no papel de parede ainda",
            "Hide the widgets": "Ocultar os widgets",
            "Window layout": "Disposição de janelas",
            "Look": "Visual",
            "Every widget follows these unless it was given a look of its own.":
                "Todos os widgets seguem isto, a menos que tenham visual próprio.",

            "Modern": "Moderno",
            "Analogue": "Analógico",
            "Sticker": "Adesivo",
            "Small": "Pequeno",
            "Wide": "Largo",
            "Large": "Grande",
            "Band": "Faixa",

            "Notes on the edge": "Notas na borda",
            "Where": "Onde",
            "Grid": "Grade",
            "Along the edge": "Ao longo da borda",
            "Which notes": "Quais notas",
            "New notes land here": "Novas notas aparecem aqui",
            "Which note": "Qual nota",
            "Drop here to take it off": "Solte aqui para remover",
            "Drop here to leave it out": "Solte aqui para não incluir",
            "The newest": "A mais recente",
            "New note": "Nova nota",
            "Choose…": "Escolher…",
            "Caption": "Legenda",
            "Written under the picture": "Escrito abaixo da foto",
            "Wallpapers": "Papéis de parede",
            "Home": "Pasta pessoal",
            "No pictures here": "Nenhuma imagem aqui",

            // ── CONTROL CENTRE ──────────────────────────────────────────────
            "The panel": "O painel",
            "Edit shows the grid, its columns and rows under the island, and a card of every block under them. Drag a block onto the cells, pull a corner or scroll to resize it, and drop it on the card to remove it; a click on a toggles or shortcuts block chooses what it carries. Columns come and go on both sides alike, so the blocks stay centred. Escape leaves, and the right button on the panel enters or leaves without opening settings.":
                "Editar exibe a grade, suas colunas e linhas sob a ilha, e um cartão com todos os blocos. Arraste um bloco para as células, puxe uma quina ou role para redimensionar, e solte no cartão para remover; clicar em um bloco de alternadores ou atalhos define seus itens. As colunas são ajustadas igualmente em ambos os lados para manter o centro. Esc sai, e o botão direito no painel alterna o modo sem abrir as configurações.",
            "A grid of the size chosen here, arranged on the panel itself.":
                "Uma grade do tamanho escolhido aqui, organizada no próprio painel.",
            "columns × rows": "colunas × linhas",
            "At a glance": "Em um relance",
            "Personal": "Pessoal",
            "Controls": "Controles",
            "Click the cell that should be the grid's corner": "Clique na célula que deve ser a quina da grade",
            "Ground": "Fundo",
            "Sides": "Laterais",
            "The icons on the wallpaper": "Os ícones no papel de parede",
            "Each group in a capsule": "Cada grupo em uma cápsula",
            "In one island the sides sit on its band": "Em uma ilha as laterais ficam na faixa",
            "In capsules": "Em cápsulas",
            "On the wallpaper": "No papel de parede",
            "Refraction": "Refração",
            "Solid black": "Preto sólido",
            "The terminal's glass, over a blur": "O vidro do terminal, sobre um desfoque",
            "Classic": "Clássico",
            "Arrange the control centre": "Organizar a central de controle",
            "The top row": "A linha superior",
            "The top row: click to choose its buttons": "A linha superior: clique para escolher seus botões",
            "Small buttons over the grid, on either side. With none, there is no row.":
                "Pequenos botões sobre a grade, em ambos os lados. Sem nenhum, a linha não é exibida.",
            "Drag a button onto either side; drag it back here to take it off.":
                "Arraste um botão para qualquer um dos lados; arraste de volta aqui para remover.",
            "Every button is on the row": "Todos os botões estão na linha",
            "Default layout": "Disposição padrão",
            "Shortcuts": "Atalhos",

            "System statistics": "Estatísticas do sistema",
            "Workspace overview": "Visão geral dos espaços",
            "Session menu": "Menu da sessão",
            "Lock the screen": "Bloquear a tela",
            "Task board": "Quadro de tarefas",
            "Packages": "Pacotes",

            "Toggles": "Alternadores",
            "Wi-Fi": "Wi-Fi",
            "Power": "Energia",
            "Focus": "Foco",
            "Microphone": "Microfone",
            "Camera": "Câmera",
            "Authentication required": "Autenticação necessária",
            "That password didn't work": "A senha informada está incorreta",
            "Password": "Senha",
            "Authorize": "Autorizar",
            "Caps Lock is on": "Caps Lock ativado",
            "Machines": "Máquinas virtuais",
            "None running": "Nenhuma em execução",
            "running": "em execução",
            "cores": "núcleos",
            "core": "núcleo",
            "Find a system…": "Localizar um sistema…",
            "New": "Nova",
            "Machines need quickemu, which ./setup packages installs.": "Máquinas virtuais requerem o quickemu, instalado via ./setup packages.",
            "No machines yet. Pick a system in New.": "Nenhuma máquina virtual ainda. Escolha um sistema em Nova.",
            "Downloading": "Baixando",
            "snapshots": "snapshots",
            "snapshot": "snapshot",
            "Paused": "Pausada",
            "Shutting down": "Desligando",
            "Running": "Em execução",
            "Cores": "Núcleos",
            "Memory": "Memória RAM",
            "Take a snapshot": "Criar um snapshot",
            "Restore %1?": "Restaurar %1?",
            "Delete it and its disk": "Excluir máquina e seu disco",
            "Reading the catalogue…": "Lendo catálogo…",
            "Version": "Versão",
            "Edition": "Edição",
            "Disk": "Disco",
            "disk": "disco",
            "Download and create": "Baixar e criar",
            "Systems from quickget": "Sistemas via quickget",
            "Close a machine's window and it keeps running": "Fechar a janela da máquina não interrompe sua execução",
            "Virtual machines": "Máquinas virtuais",
            "Development servers": "Servidores de desenvolvimento",
            "Screen time": "Tempo de tela",
            "on average": "em média",
            "Counting from now": "Contando a partir de agora",
            "Nothing yet today": "Nada registrado hoje ainda",
            "Today": "Hoje",
            "Yesterday": "Ontem",
            "This week": "Esta semana",
            "Daily average": "Média diária",
            "Day": "Dia",
            "Week": "Semana",
            "Month": "Mês",
            "About your daily average": "Próximo à sua média diária",
            "more than your daily average": "mais que a sua média diária",
            "less than your daily average": "menos que a sua média diária",
            "than last week": "em relação à semana passada",
            "than last month": "em relação ao mês passado",
            "less": "a menos",
            "in total": "no total",
            "Screen time counts from now on, while the session is in use. Come back in a while.": "O tempo de tela começa a contar a partir de agora, enquanto a sessão estiver ativa. Volte mais tarde para ver os dados.",
            "Most used": "Mais usados",
            "Groups": "Grupos",
            "First use": "Primeiro uso",
            "Total": "Total",
            "Unlocks": "Desbloqueios",
            "from": "de",
            "Longest session": "Sessão mais longa",
            "avg": "média",
            "Sessions": "Sessões",
            "Development": "Desenvolvimento",
            "Social": "Social",
            "Internet": "Internet",
            "Entertainment": "Entretenimento",
            "Creativity": "Criatividade",
            "Productivity": "Produtividade",
            "Servers": "Servidores",
            "None listening": "Nenhum escutando",
            "listening": "escutando",
            "open to the network": "aberto para a rede",
            "this machine": "esta máquina",
            "the network too": "a rede também",
            "Stopping": "Parando",
            "Start a server inside a project and its port appears here.": "Inicie um servidor dentro de um projeto e a porta aparecerá aqui.",
            "Camera effects": "Efeitos de câmera",
            "Effects and reactions for your calls": "Efeitos e reações para suas chamadas de vídeo",
            "Off · no program can use it": "Desativado · nenhum programa pode utilizar",
            "In use by": "Em uso por",
            "Pick": "Escolher",
            "in any call": "em qualquer chamada",
            "Virtual camera": "Câmera virtual",
            "No camera is plugged in.": "Nenhuma câmera conectada.",
            "Run ./setup camera once to set the virtual camera up.": "Execute ./setup camera uma vez para configurar a câmera virtual.",
            "The virtual camera is off.": "A câmera virtual está desativada.",
            "The camera could not be opened. Another program may be holding it.": "Não foi possível abrir a câmera. Outro aplicativo pode estar utilizando-a.",
            "Waking the camera": "Inicializando câmera",
            "LIVE": "AO VIVO",
            "Preview": "Prévia",
            "face": "rosto",
            "faces": "rostos",
            "Reactions": "Reações",
            "Thumbs up": "Polegar para cima",
            "Heart": "Coração",
            "Peace": "Paz e amor",
            "Thumbs down": "Polegar para baixo",
            "Horns": "Rock",
            "OK": "OK",
            "Middle finger": "Dedo médio",
            "Natural": "Natural",
            "Mono": "Monocromático",
            "Blur back": "Desfocar fundo",
            "Centre Stage": "Palco Central",
            "Shades": "Óculos de sol",
            "Crown": "Coroa",
            "Sparkle": "Brilho",
            "Photo saved and copied": "Foto salva e copiada",
            "Photo saved": "Foto salva",
            "No photo was taken": "Nenhuma foto foi tirada",
            "On the island while one runs": "Na ilha enquanto uma estiver em execução",
            "Airplane": "Avião",
            "Output": "Saída",
            "Notch": "Notch",
            "Shadows": "Sombras",
            "Game mode": "Modo de jogo",
            "Game mode on": "Modo de jogo ativado",
            "Game mode off": "Modo de jogo desativado",
            "Everything still, for a game or a slow machine.": "Desativa animações e efeitos pesados, ideal para jogos ou economia de recursos.",
            "Stops the shell's animations, the spectrum and the pet, makes the island, the dock and the widgets solid without shadows, and turns off Hyprland's animations, blur, shadow and glass. The settings below are kept and come back when it is turned off.":
                "Pausa as animações do shell, o espectro e o mascote, torna a ilha, a dock e os widgets sólidos sem sombras, e desativa animações, desfoque, sombra e vidro do Hyprland. As configurações são preservadas e retornam quando desativado.",
            "Capture": "Captura",
            "Annotate": "Anotar",
            "Read text": "Ler texto (OCR)",
            "Colour": "Cor",
            "Record": "Gravar",
            "Clear clipboard": "Limpar área de transferência",

            // ── DOCK ────────────────────────────────────────────────────────
            "The dock": "A dock",
            "The dock is off": "A dock está desativada",
            "Your kept and open applications, on one edge of the screen.":
                "Seus aplicativos fixados e abertos, em uma borda da tela.",
            "An empty dock is not drawn. Icons are reordered by dragging them on the dock itself, and the top edge is left to the bar.":
                "Uma dock vazia não é desenhada. Os ícones são reordenados arrastando-os na própria dock, e a borda superior é reservada para a barra.",
            "Show the dock": "Exibir a dock",
            "Edge": "Borda",
            "Alignment": "Alinhamento",
            "Icon size": "Tamanho dos ícones",
            "Magnify on hover": "Ampliar ao passar o mouse",
            "Behaviour": "Comportamento",
            "The launcher button opens the island's launcher, and open applications appear after a divider while they run. Windows and widgets pass under the dock, so moving or hiding it moves nothing else.":
                "O botão do inicializador abre o launcher da ilha, e aplicativos em execução aparecem após um divisor. Janelas e widgets passam sob a dock, sem interferir no layout ao mover ou ocultar.",
            "Launcher button": "Botão do inicializador",
            "Open applications": "Aplicativos abertos",
            "On every screen": "Em todas as telas",
            "Intelligent auto-hide": "Ocultação inteligente",
            "Hides above grid or fullscreen windows, appears on top hover":
                "Oculta quando há janelas no grid ou em tela cheia, surge ao passar o mouse no topo",
            "Always visible": "Sempre visível",
            "Not available with the bezel": "Não disponível com o bezel",
            "Zen": "Zen",
            "One on each, all showing the same": "Uma em cada tela, todas exibindo o mesmo conteúdo",
            "Only on the screen you are on": "Apenas na tela onde o cursor estiver",
            "One on each, and the one you are on is the live one":
                "Uma em cada tela, e a da tela ativa é a funcional",
            "Hide until pointed at": "Ocultar até apontar o mouse",
            "Kept on it": "Fixados nela",
            "These stay whether they are running or not, and they lead the launcher's list too.":
                "Permanecem fixos estejam em execução ou não, e também aparecem no topo do inicializador.",
            "Nothing kept yet.": "Nenhum aplicativo fixado ainda.",
            "This application is no longer installed":
                "Este aplicativo não está mais instalado",
            "Add an application": "Adicionar um aplicativo",
            "New window": "Nova janela",
            "Keep in the dock": "Fixar na dock",
            "Remove from the dock": "Desafixar da dock",
            "Close": "Fechar",
            "Close all windows": "Fechar todas as janelas",

            // ── LAUNCHER ────────────────────────────────────────────────────
            "The list": "A lista",
            "What the launcher lists with nothing typed, and how tall it gets.":
                "O que o inicializador lista quando nada for digitado, e a sua altura.",
            "By use ranks applications by launches, with older launches counting for less; those kept on the dock come first until something else is used more. As tall as the answer sizes the island to the results, up to the limit above; off, the box is fixed and the list scrolls.":
                "Por uso ordena os aplicativos por frequência de abertura, dando menos peso aos acessos mais antigos; os fixados na dock aparecem primeiro até que outro seja mais usado. Ajustar à resposta adapta a ilha aos resultados até o limite acima; desligado, o tamanho é fixo e a lista rola.",
            "Order": "Ordenação",
            "By use": "Por uso",
            "Alphabetical": "Alfabética",
            "Results shown": "Resultados exibidos",
            "rows": "linhas",
            "As tall as the answer": "Ajustar à resposta",
            "Only as tall as it needs": "Apenas a altura necessária",
            "A fixed box": "Uma caixa fixa",
            "Plain text searches applications, and a sigil in front switches mode. Click one to change it.":
                "Texto comum busca aplicativos, e um caractere prefixo troca de modo. Clique em um para alterar.",

            "Calculate": "Calcular",
            "Work something out": "Fazer cálculos",
            "Desk": "Área de Trabalho",
            "Open a panel or an action": "Abrir um painel ou ação",
            "Find an open window": "Encontrar uma janela aberta",
            "Start a countdown": "Iniciar contagem regressiva",
            "Note": "Nota",
            "Keep a note": "Salvar uma nota",
            "Copy something again": "Copiar algo novamente",
            "Emoji": "Emoji",
            "Copy an emoji": "Copiar um emoji",
            "Recent": "Recentes",
            "Smileys & Emotion": "Carinhas e Emoções",
            "People & Body": "Pessoas e Corpo",
            "Animals & Nature": "Animais e Natureza",
            "Food & Drink": "Comida e Bebida",
            "Travel & Places": "Viagens e Lugares",
            "Activities": "Atividades",
            "Objects": "Objetos",
            "Symbols": "Símbolos",
            "Flags": "Bandeiras",
            "No animated wallpapers yet. Videos in ~/.local/share/wallpapers/animated show up here.":
                "Nenhum papel de parede animado ainda. Vídeos colocados em ~/.local/share/wallpapers/animated aparecerão aqui.",
            "Apps": "Aplicativos",

            "Clipboard history": "Histórico da área de transferência",
            "Everything copied, searchable from the launcher.":
                "Tudo o que foi copiado, pesquisável no inicializador.",
            "Copies from password managers are never stored, and turning the history off stops the watcher entirely. Emptying on lock is off by default, since the lock already protects the session.":
                "Cópias feitas a partir de gerenciadores de senhas nunca são salvas, e desativar o histórico para o monitoramento por completo. Limpar ao bloquear fica desligado por padrão, pois o bloqueio já protege a sessão.",
            "Keep a history": "Manter histórico",
            "Watching": "Monitorando",
            "Entries kept": "Entradas mantidas",
            "No history is being kept": "Nenhum histórico está sendo mantido",
            "Keep images": "Manter imagens",
            "Pictures as well as text": "Imagens e texto",
            "Text only": "Apenas texto",
            "Empty it on lock": "Limpar ao bloquear",
            "Thrown away on lock": "Descartado ao bloquear",
            "Kept across a lock": "Mantido após bloquear",

            // ── APPEARANCE ──────────────────────────────────────────────────
            "The palette follows the wallpaper, and both are chosen in the island.":
                "A paleta de cores acompanha o papel de parede, e ambos são escolhidos na ilha.",
            "This opens the island's appearance panel, where wallpapers and palettes are chosen together.":
                "Abre o painel de aparência da ilha, onde papéis de parede e paletas são escolhidos juntos.",
            "Theme and wallpaper": "Tema e papel de parede",

            "Transition": "Transição",
            "How the next wallpaper arrives over the last one.":
                "Como o próximo papel de parede surge sobre o anterior.",
            "Random picks one of the effects above each time a wallpaper is applied.":
                "Aleatório escolhe um dos efeitos acima sempre que um novo papel de parede é aplicado.",
            "Effect": "Efeito",
            "Fade": "Esmaecer",
            "Wipe": "Varrer",
            "Wave": "Onda",
            "Circle": "Círculo",
            "Outer": "De fora para dentro",
            "Random": "Aleatório",

            "Greeting": "Saudação",
            "The animation shown beside fastfetch when you run fa.":
                "A animação exibida ao lado do fastfetch ao executar fa.",
            "Four pixel-art scenes, redrawn in the current palette whenever it changes. Random picks a new one on every run, and fa with a scene name (fa koi) plays that one.":
                "Quatro cenas em pixel art, redesenhadas na paleta atual sempre que ela muda. Aleatório escolhe uma nova a cada execução, e fa com o nome da cena (fa koi) reproduz aquela.",
            "Scene": "Cena",
            "Lava lamp": "Lâmpada de lava",
            "Critters": "Criaturas",

            "How Hyprland draws every window, this one included.":
                "Como o Hyprland desenha cada janela, incluindo esta.",
            "Dwindle splits the space each new window lands in, Master keeps one large window beside a stack, and Scrolling lays windows in a row wider than the screen. The preview below is live and at full size. The border stays at zero because gaps and rounding already separate windows; the inner gap applies to each side of a window, so two windows sit twice that apart.":
                "Dwindle divide o espaço onde cada nova janela abre, Master mantém uma janela principal ao lado de uma pilha e Scrolling posiciona janelas em uma fileira mais larga que a tela. A prévia abaixo é em tempo real e em tamanho total. A borda fica em zero pois espaçamentos e cantos já separam as janelas; o espaço interno se aplica a cada lado da janela, totalizando o dobro entre duas janelas.",
            "Window rounding": "Arredondamento das janelas",
            "Border width": "Largura da borda",
            "Inner gap": "Espaçamento interno",
            "Outer gap": "Espaçamento externo",
            "Inactive opacity": "Opacidade inativa",

            "Depth": "Profundidade",
            "Liquid": "Líquido",
            "Clear frosted glass, lit at the edge": "Vidro fosco límpido, iluminado na borda",
            "Terminal": "Terminal",
            "size": "tamanho",
            "Glass": "Vidro",
            "Needs the refraction plugin — run ./setup plugins":
                "Requer o plugin de refração, execute ./setup plugins",
            "Shadow": "Sombra",
            "Lifted off the wallpaper": "Destacado do papel de parede",
            "Flat": "Plano",

            "Interface": "Interface",
            "Everything Quickshell draws.":
                "Tudo o que o Quickshell renderiza.",
            "Monospace": "Monoespaçada",
            "The bar's glyphs and readings, and the terminal.":
                "Os ícones e valores da barra, e o terminal.",
            "kitty is given the same family, so the terminal and the shell always match. It must be a Nerd Font, or the bar's icons show as empty boxes.":
                "O terminal kitty recebe a mesma fonte para manter consistência com o shell. Deve ser uma Nerd Font para que os ícones da barra não fiquem em branco.",
            "Icons need a Nerd Font patched family.":
                "Ícones requerem uma fonte modificada Nerd Font.",

            "The shell": "O shell",
            "The island, its panels, the chips — everything Qt draws.":
                "A ilha, seus painéis, os chips, tudo o que o Qt renderiza.",
            "Pace": "Velocidade",
            "Smooth": "Suave",
            "Snappy": "Rápido",
            "Springy": "Elástico",
            "How Hyprland animates windows. Reapplied after every reload.":
                "Como o Hyprland anima janelas. Reaplica após cada recarga.",
            "Preset": "Predefinição",
            "Glide": "Deslizar",
            "Brisk": "Dinâmico",
            "Calm": "Calmo",
            "Bounce": "Quicar",
            "Scales into place and decelerates with a long tail. Quick, and it never bounces.":
                "Aparece com escala suave e desacelera de forma limpa. Ágil e sem efeito elástico.",
            "Half the distance and half the time. Movement you register rather than watch.":
                "Metade da distância e metade do tempo. Movimento sutil e instantâneo.",
            "Long and soft, and the screen fades between workspaces rather than sliding.":
                "Longo e suave, com transição gradual entre espaços de trabalho em vez de deslizamento.",
            "Overshoots a little and settles back. The look most Hyprland presets are after.":
                "Ultrapassa levemente e estabiliza. O efeito característico da maioria dos temas do Hyprland.",
            "Nothing moves. Windows and workspaces appear where they are going to be.":
                "Nada se move. Janelas e espaços de trabalho aparecem diretamente na posição final.",

            // ── DISPLAYS ────────────────────────────────────────────────────
            "The screens": "As telas",
            "Drag one to move it, click one to change it.":
                "Arraste para mover, clique para alterar.",
            "Arrangements are saved per set of connected monitors, identified by the monitor rather than the port, so moving a cable or closing the lid keeps them.":
                "As disposições são salvas para cada conjunto de monitores conectados, identificadas pelo monitor e não pela porta, preservando as configurações mesmo ao trocar de conexão ou fechar a tampa.",
            "Every screen shows the primary's": "Todas as telas espelham a principal",
            "Extended across all of them": "Estendido entre todas elas",
            "Extend": "Estender",
            "Ten for each screen: the main one 1–10, the next 11–20": "Dez para cada tela: a principal de 1 a 10, a secundária de 11 a 20",
            "Every screen shares the same ten": "Todas as telas compartilham os mesmos dez espaços",
            "Shared": "Compartilhados",
            "Per screen": "Por tela",
            "Mirror": "Espelhar",
            "The main screen": "A tela principal",
            "Where anything with no screen of its own goes, and what mirroring copies.":
                "Onde vai o que não tem tela própria, e o que o espelhamento duplica.",
            "This arrangement": "Esta disposição",
            "Kept against these screens and no others.":
                "Salva para estas telas e nenhuma outra.",
            "Forget it": "Esquecer",
            "Hands these screens back to Hyprland's own placement":
                "Devolve estas telas para a disposição padrão do Hyprland",
            "Forget": "Esquecer",
            "Which screen": "Qual tela",
            "Editing": "Editando",
            "Off — out of the layout, and still plugged in":
                "Desligada (fora da disposição, ainda conectada)",
            "Dark — the panel is asleep, and the workspaces are still on it":
                "Escura (o painel está em repouso, e os espaços continuam nele)",
            "The only screen there is": "A única tela disponível",
            "Only one screen is plugged in": "Apenas uma tela está conectada",
            "Only one screen is on": "Apenas uma tela está ligada",
            "Rounded corners": "Cantos arredondados",
            "Every screen's corners curve like the windows": "Os cantos de cada tela se curvam como as janelas",
            "Square, as the panel is": "Retos, como o painel",
            "Resolution": "Resolução",
            "What the monitor itself reported, largest first.":
                "O que o próprio monitor reportou, do maior para o menor.",
            "Only the modes the monitor reports are listed. Choosing a resolution selects its highest refresh rate.":
                "Apenas os modos reportados pelo monitor são listados. Escolher uma resolução seleciona sua maior taxa de atualização.",
            "Refresh rate": "Taxa de atualização",
            "The screen is off": "A tela está desligada",
            "The only rate at this resolution": "A única taxa nesta resolução",
            "Rotation": "Rotação",
            "Variable refresh": "Taxa de atualização variável (VRR)",

            "When the lid closes": "Quando a tampa fechar",
            "Only applies with another screen connected.":
                "Aplica-se apenas com outra tela conectada.",
            "With nothing else connected, closing the lid is left to logind, which suspends. With another screen connected, the shell can switch the panel off and move its workspaces to the remaining screen, then bring them back when the lid opens.":
                "Sem outra tela conectada, fechar a tampa é gerenciado pelo logind, que suspende. Com outra tela conectada, o shell pode desligar o painel do notebook e mover seus espaços para a tela restante, restaurando-os quando a tampa for aberta.",
            "The laptop's screen": "A tela do notebook",
            "Switched off, and its workspaces move over":
                "Desliga, e seus espaços são transferidos",
            "Left on behind the lid": "Permanece ligada com a tampa fechada",
            "Left to the system": "Gerenciado pelo sistema",
            "No laptop panel on this machine": "Nenhum painel de notebook nesta máquina",
            "Switch it off": "Desligar",
            "Leave it on": "Deixar ligada",
            "The system decides": "O sistema decide",

            "Right now": "Neste momento",
            "The current state, as the shell detects it.":
                "O estado atual, conforme detectado pelo shell.",
            "The laptop's panel": "O painel do notebook",
            "Not on this machine": "Não presente nesta máquina",
            "%1 — off, and still plugged in": "%1: desligada (ainda conectada)",
            "%1 — on": "%1: ligada",
            "Other screens": "Outras telas",
            "None — the system handles the lid": "Nenhum (o sistema gerencia a tampa)",

            "Night light": "Luz noturna",

            // ── INPUT ───────────────────────────────────────────────────────
            "Layouts": "Layouts de teclado",
            "Loaded in this order; the first is active at login.":
                "Carregados nesta ordem; o primeiro fica ativo ao iniciar a sessão.",
            "Switch between them": "Alternar entre eles",
            "Only one layout is loaded": "Apenas um layout está configurado",
            "Layouts, in order": "Layouts, em ordem",
            "· the first is the one you start on": "· a primeira é onde você começa",
            "Search {} layouts": "Buscar em {} layouts",
            "Caps Lock": "Caps Lock",

            "Typing": "Digitação",
            "How fast a held key repeats, once it has started.":
                "A rapidez com que uma tecla pressionada repete, após iniciar.",
            "Key repeat rate": "Taxa de repetição de teclas",

            "Zero is the device's native speed; either side adjusts libinput's acceleration.":
                "Zero é a velocidade nativa do dispositivo; valores ajustam a aceleração do libinput.",
            "Sensitivity": "Sensibilidade",

            "The cursor": "O cursor",
            "One vector shape, sharp at any size — Palette follows the wallpaper.":
                "Formato vetorial, nítido em qualquer tamanho: a paleta segue o papel de parede.",
            "Colour and size are applied with hyprctl setcursor, so every application updates at once and Palette follows wallpaper changes. Shake to find briefly enlarges the pointer when you shake the mouse; it needs the hypr-dynamic-cursors plugin (./setup plugins).":
                "Cor e tamanho são aplicados com hyprctl setcursor para atualizar todos os aplicativos de uma vez. Agitar para localizar amplia o ponteiro ao mover o mouse rapidamente; requer o plugin hypr-dynamic-cursors (./setup plugins).",
            "Cursor colour": "Cor do cursor",
            "Cursor size": "Tamanho do cursor",
            "24 px — the default": "24 px (o padrão)",
            "Shake to find": "Agitar para localizar",
            "Needs the cursor plugin — run ./setup plugins":
                "Requer o plugin de cursor, execute ./setup plugins",
            "Black": "Preto",
            "White": "Branco",
            "Red": "Vermelho",
            "Orange": "Laranja",
            "Yellow": "Amarelo",
            "Green": "Verde",
            "Blue": "Azul",
            "Purple": "Roxo",
            "Pink": "Rosa",

            // ── KEYS ────────────────────────────────────────────────────────
            "The shell's own": "Atalhos do shell",
            "Click a combination to change it. Every key here belongs to the profile in use.":
                "Clique em uma combinação para alterá-la. Cada tecla aqui pertence ao perfil ativo.",
            "Each profile has its own complete set of keys. A combination already in use is allowed, since Hyprland fires both binds, but the row warns you before you apply it.":
                "Cada perfil possui seu próprio conjunto completo de atalhos. Uma combinação já existente é permitida, pois o Hyprland executa ambos os atalhos, mas a linha avisa antes de aplicar.",
            "The compositor's": "Atalhos do compositor",
            "Windows, workspaces, the media keys, the screen off — changed the same way, and kept in the same profile.":
                "Janelas, espaços de trabalho, teclas multimídia, tela desligada, alterados da mesma forma e mantidos no mesmo perfil.",
            "The shell writes these to a file keybinds.lua reads, so applying a change reloads Hyprland. Mouse bindings are shown but cannot be rebound here.":
                "O shell grava estes atalhos em um arquivo lido pelo keybinds.lua, recarregando o Hyprland ao aplicar. Atalhos de mouse são exibidos mas não podem ser redefinidos aqui.",
            "Find a key or an action": "Buscar uma tecla ou ação",
            "No binding matches that": "Nenhum atalho corresponde a isso",
            "Utilities": "Utilitários",
            "Other": "Outros",

            "Control centre": "Central de controle",
            "Colour picker": "Seletor de cores",
            "Capture a region": "Capturar uma região",
            "Capture a window": "Capturar uma janela",
            "Capture the screen": "Capturar a tela inteira",
            "Capture and annotate": "Capturar e anotar",
            "Read a region": "Ler texto de uma região (OCR)",
            "Record the screen": "Gravar a tela",
            "Next module": "Próximo módulo",
            "Previous module": "Módulo anterior",
            "Clock swap": "Alternar relógio",

            "unbound": "não atribuído",
            "Press a key…": "Pressione uma tecla…",
            "Click, then press a key": "Clique e pressione uma tecla",
            "Pick the key, and any modifiers to hold with it.":
                "Escolha a tecla e os modificadores correspondentes.",
            "is already": "já é",
            "Both would fire.": "Ambos seriam executados.",

            // ── SESSION ─────────────────────────────────────────────────────
            "You": "Você",
            "Picture": "Foto de perfil",
            "Click it, or drop an image here": "Clique ou arraste uma imagem aqui",
            "Choose a picture": "Escolher uma imagem",
            "Name": "Nome",

            "Just enough to make the text underneath unreadable.":
                "O suficiente para tornar o texto por baixo ilegível.",
            "The preview uses the wallpaper, since the lock screen's own capture is taken when it locks. It applies the same blur with the capsule on top, so you can judge how it reads.":
                "A prévia usa o papel de parede, já que a captura da tela de bloqueio ocorre no momento em que ela bloqueia. Ela aplica o mesmo desfoque com a cápsula por cima para avaliar a legibilidade.",
            "No wallpaper to show": "Nenhum papel de parede para exibir",
            "The login screen always draws it stacked.":
                "A tela de login sempre o exibe empilhado.",
            "The login screen runs before anyone has signed in, so it cannot read your settings.":
                "A tela de login é executada antes de qualquer usuário entrar, portanto não pode ler suas configurações.",
            "Stacked": "Empilhado",
            "Inline": "Em linha",
            "Type to unlock": "Digite para desbloquear",

            "When you leave it alone": "Quando você deixar o computador ocioso",
            "All three are off by default.":
                "Todos os três vêm desativados por padrão.",
            "The shell uses the compositor's idle notifications, and media that inhibits idle (mpv, browsers) holds all three off. Set screen off after the lock, since the lock captures the screen as it starts; suspend always locks first and is skipped if the lock does not come up.":
                "O shell utiliza as notificações de inatividade do compositor, e mídias que inibem inatividade (como reprodutores e navegadores) suspendem os três temporizadores. Configure o desligamento de tela para depois do bloqueio, pois o bloqueio captura a tela ao iniciar; a suspensão sempre bloqueia antes.",
            "Never": "Nunca",
            "Lock after": "Bloquear após",
            "Screen off after": "Desligar tela após",
            "before the lock": "antes do bloqueio",
            "Suspend after": "Suspender após",

            // ── SYSTEM ──────────────────────────────────────────────────────
            "Changes are saved to the profile in use as you make them.":
                "As alterações são salvas no perfil ativo à medida que você as faz.",
            "A profile holds the bar, widgets, dock, launcher, control centre, look, keys and wallpaper with its palette. Screens, your name and picture, language, weather location, GitHub user, Do not disturb and night light stay with the machine, and notes, tasks and clipboard are shared by every profile.":
                "Um perfil reúne a barra, widgets, dock, inicializador, central de controle, visual, atalhos e papel de parede com sua paleta. Monitores, seu nome e foto, idioma, local do clima, usuário do GitHub, Não perturbe e luz noturna pertencem à máquina, enquanto notas, tarefas e área de transferência são compartilhados por todos os perfis.",
            "Profile": "Perfil",
            "New profile": "Novo perfil",
            "Import…": "Importar…",
            "In use": "Em uso",
            "Switch": "Alternar",
            "Delete": "Excluir",
            "Keep": "Manter",
            "Rename": "Renomear",
            "Duplicate": "Duplicar",
            "Export to a file…": "Exportar para um arquivo…",
            "Export the profile": "Exportar o perfil",
            "Import a profile": "Importar um perfil",
            "Profiles (*.json)": "Perfis (*.json)",
            "Deleted for good — there is no undo": "Excluído permanentemente, não há como desfazer",
            "Enter to keep the name · Esc to leave it": "Enter para salvar o nome · Esc para cancelar",
            "Grouped bar": "Barra agrupada",
            "Spread bar": "Barra espalhada",
            "dock at the bottom": "dock na parte inferior",
            "dock on the left": "dock na esquerda",
            "dock on the right": "dock na direita",
            "no dock": "sem dock",
            "nothing on the desk": "nada na área de trabalho",
            "widget": "widget",
            "widgets": "widgets",

            "This window": "Esta janela",
            "The language of this window.":
                "O idioma desta janela.",
            "Only the settings window is translated, and anything without a translation appears in English. Files the shell writes, such as generated themes, are always in English.":
                "A janela de configurações é traduzida, e qualquer item sem tradução aparece em inglês. Arquivos gerados pelo shell permanecem em inglês.",
            "Language": "Idioma",

            "This machine": "Esta máquina",
            "PROCESSOR": "PROCESSADOR",
            "MEMORY": "MEMÓRIA",
            "UPTIME": "ATIVIDADE",
            "VERSION": "VERSÃO",
            "edited": "editado",
            "threads": "threads",
            "% in use": "% em uso",
            "since boot": "desde a inicialização",

            "impasto itself, not the packages it runs.":
                "o impasto em si, não os pacotes que ele executa.",
            "Update pulls the checkout impasto was installed from and runs the installer again in a terminal, where its questions and your password stay visible.":
                "Atualizar baixa o repositório a partir do qual o impasto foi instalado e executa o instalador novamente em um terminal, onde perguntas e senha ficam visíveis.",
            "Check for updates": "Verificar atualizações",
            "Check": "Verificar",
            "Checking…": "Verificando…",
            "Not checked yet": "Ainda não verificado",
            "The remote did not answer": "O servidor remoto não respondeu",
            "Up to date": "Atualizado",
            "checked at": "verificado às",
            "commit waiting": "commit pendente",
            "commits waiting": "commits pendentes",
            "Update": "Atualizar",
            "To": "Para",
            "Commits of your own are not on the remote":
                "Existem commits locais que não estão no servidor remoto",
            "No checkout to update from": "Nenhum repositório local para atualizar",
            "No remote to compare with": "Nenhum servidor remoto para comparar",
            "WHAT IS WAITING": "O QUE ESTÁ PENDENTE",
            "more": "mais",

            "Changed files": "Arquivos modificados",
            "impasto's own files, as you left them.":
                "Os arquivos do impasto, como você os deixou.",
            "Updates leave a file you deleted deleted, and a file you edited as you edited it, with any newer version beside it as .new. Restore puts impasto's version back; yours, if there was one, is kept in ~/.local/state/impasto/backups.":
                "Atualizações mantêm arquivos excluídos apagados e arquivos editados preservados, colocando versões mais recentes ao lado com extensão .new. Restaurar recupera a versão original do impasto; a sua versão é mantida em ~/.local/state/impasto/backups.",
            "No checkout to restore from": "Nenhum repositório para restaurar",
            "Every file as installed": "Todos os arquivos como instalados originalmente",
            "file edited": "arquivo editado",
            "files edited": "arquivos editados",
            "file deleted": "arquivo excluído",
            "files deleted": "arquivos excluídos",
            "Restore all": "Restaurar tudo",
            "Restore": "Restaurar",
            "DELETED": "EXCLUÍDOS",
            "EDITED": "EDITADOS",
            "files": "arquivos",
            "newer version waiting": "há uma versão mais recente",
            "Keep mine": "Manter a minha versão",
            "Use the new one": "Usar a nova versão",
            "Show all": "Exibir todos",
            "Show fewer": "Exibir menos",

            "Face unlock": "Desbloqueio facial",
            "The lock screen only, with the infrared camera.":
                "Apenas na tela de bloqueio, com câmera infravermelha.",
            "howdy keeps the faces where only root can read them, so adding or removing one asks for your password. The login screen, sudo and polkit still ask for the password.":
                "O howdy armazena dados faciais com permissão root exclusiva, solicitando sua senha para adicionar ou remover rostos. A tela de login, sudo e polkit continuarão solicitando senha.",
            "Needs an infrared camera": "Requer uma câmera infravermelha",
            "Set up": "Configurar",
            "Finish setting up": "Concluir configuração",
            "Add a face": "Adicionar rosto",
            "Confirm with your password, then look at the camera":
                "Confirme com sua senha e olhe para a câmera",
            "FACES": "ROSTOS",
            "Try it": "Testar",
            "Try": "Testar",
            "Looking…": "Procurando…",
            "Recognised": "Reconhecido",
            "Not recognised": "Não reconhecido",
            "Not set up": "Não configurado",
            "Half set up": "Configuração parcial",
            "Adding a face…": "Adicionando rosto…",
            "Removing…": "Removendo…",
            "Face added": "Rosto adicionado",
            "No face seen — try with more light": "Nenhum rosto identificado: tente com mais iluminação",
            "More than one face in view": "Mais de um rosto no enquadramento",
            "Too dark for the camera": "Muito escuro para a câmera",
            "The face was not added": "O rosto não foi adicionado",
            "No face yet": "Nenhum rosto cadastrado ainda",
            "Face %1": "Rosto %1",
            "%1 face": "%1 rosto",
            "%1 faces": "%1 rostos",

            "Your account's name and picture, on the lock and login screens.":
                "O nome e foto da sua conta nas telas de bloqueio e de login.",
            "The name is your account's full name, and the picture is kept where the login screen reads it too, made square. Click the picture or drop an image on the card to change it.":
                "O nome é o nome completo da conta, e a foto é mantida em formato quadrado onde a tela de login também a lê. Clique na foto ou arraste uma imagem sobre o cartão para alterá-la.",
            "Saving…": "Salvando…",
            "The picture was not changed": "A foto não foi alterada",
            "The lock screen only, until ./setup system": "Apenas na tela de bloqueio, até executar ./setup system",
            "On the lock and login screens": "Nas telas de bloqueio e de login",

            "Only the profile in use. The others are left as they were.":
                "Apenas o perfil ativo. Os demais permanecem inalterados.",
            "Reset returns every setting in this profile to its default, clears the compositor overrides and reloads Hyprland. Machine settings such as screens, name, picture and language are kept, and there is no undo.":
                "Restaura todas as configurações deste perfil para os padrões, limpa substituições do compositor e recarrega o Hyprland. Configurações da máquina como telas, nome, foto e idioma são mantidas.",
            "Where the settings live": "Onde as configurações ficam salvas",
            "Reset this profile": "Restaurar este perfil",
            "Back to the defaults": "Voltar aos padrões",
            "A Hyprland shell, and the desk around it":
                "Um shell para o Hyprland e ambiente de trabalho integrado",

            "A notch cuts the island into the top edge, and the bar's top margin no longer applies to it.":
                "O notch recorta a ilha na borda superior, e a margem superior da barra deixa de se aplicar a ela.",
            "Animation": "Animação",
            "Bar": "Barra",
            "Classic is solid black, Glass the accent-tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane. Its typeface is the monospace one, under Type.":
                "Clássico é preto sólido, Vidro é o fundo tingido sobre o desfoque do papel de parede, e Líquido é uma superfície translúcida límpida. A fonte utilizada é a monoespaçada, em Tipografia.",
            "Classic is solid black, Glass the terminal's tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane that lets the wallpaper's own colours through. The island is always the bar's.":
                "Clássico é preto sólido, Vidro é o fundo tingido do terminal sobre o desfoque do papel de parede, e Líquido é uma superfície límpida que deixa transparecer as cores do fundo.",
            "Classic is solid black, Glass the terminal's tinted ground over a blur of the wallpaper, and Liquid a clear frosted pane. Background sets how opaque the capsule is; lower it to let the blurred wallpaper through.":
                "Clássico é preto sólido, Vidro é o fundo tingido do terminal sobre o desfoque do fundo, e Líquido é uma superfície translúcida. O Fundo ajusta a opacidade da cápsula.",
            "How Hyprland lays out, draws and animates windows.":
                "Como o Hyprland organiza, desenha e anima janelas.",
            "How the bar is drawn round the island.":
                "Como a barra é desenhada ao redor da ilha.",
            "How the top bar is drawn, what it carries and its workspaces.":
                "Como a barra superior é desenhada, o que ela contém e seus espaços de trabalho.",
            "Inactive opacity fades the windows without focus. Blur shows behind anything translucent, such as the terminal. Refraction (a Hyprland plugin, tuned in look.lua) frosts and bends what is behind a window, like wet glass.":
                "A opacidade inativa atenua janelas sem foco. O desfoque aparece atrás de elementos translúcidos, como o terminal. A refração (plugin do Hyprland ajustado em look.lua) desfoca e curva o que está atrás da janela, como vidro molhado.",
            "Look them up": "Pesquisar letras",
            "Looked up on lrclib.net by title and artist, which needs no account. They show in the island's glance and its media card, in the desktop's lyrics widget and on the lock screen when it is set to show them.":
                "Buscadas no lrclib.net por título e artista, sem necessidade de conta. Aparecem na visão rápida da ilha, no cartão de mídia, no widget de letras da área de trabalho e na tela de bloqueio quando configurada para exibi-las.",
            "Notes on the edges": "Notas nas bordas",
            "Position": "Posição",
            "Profiles, updates, language and this machine.":
                "Perfis, atualizações, idioma e esta máquina.",
            "The icon size everything on the dock scales with, and what the capsule is made of.":
                "O tamanho de ícone que define a escala da dock e o acabamento da cápsula.",
            "The island at rest, what runs beside the time, and notifications.":
                "A ilha em repouso, o que fica ao lado da hora e as notificações.",
            "The lyrics follow the Lyrics switch on the Modules page, and are looked up on lrclib.net.":
                "As letras seguem o alternador de Letras na página Módulos e são consultadas no lrclib.net.",
            "The notes stuck on the screen's edges and the spectrum's bars leave when a window opens and come back when the last one closes; the spectrum stops listening meanwhile. Off, the notes stay over the windows and the bars under them.":
                "As notas fixadas nas bordas da tela e as barras de espectro desaparecem quando uma janela abre e retornam quando a última fecha; o espectro para de ouvir nesse período. Desativado, as notas ficam sobre as janelas e as barras sob elas.",
            "The style keeps what is on the bar and only changes how it is drawn: grouped round the island, spread to the two edges, all inside one capsule, or a bezel across the top edge. What each side carries is arranged in Layout. Rounded corners round every screen, and curve under the bezel's ends.":
                "O estilo mantém o conteúdo da barra e altera a forma de exibição: agrupado ao redor da ilha, espalhado nas duas pontas, tudo em uma cápsula ou moldura no topo. O conteúdo de cada lado é definido em Disposição. Cantos arredondados suavizam as bordas da tela e acompanham as pontas da moldura.",
            "The words of whatever is playing, wherever they are shown.":
                "As letras da música em reprodução, onde quer que sejam exibidas.",
            "Their order is set by dragging them on the dock, and right-clicking a dock icon also keeps or removes it. The launcher puts them first, so the list stays editable with the dock off.":
                "A ordem é definida arrastando os ícones na dock, e o clique com botão direito fixa ou remove. O inicializador os coloca no topo para que a lista permaneça editável com a dock desativada.",
            "Wallpaper, terminal, fonts and the shell's motion.":
                "Papel de parede, terminal, fontes e animações do shell.",
            "What else the dock shows, and when it hides.":
                "O que mais a dock exibe e quando ela se oculta.",
            "What kitty's window is made of.": "O acabamento da janela do terminal kitty.",
            "What makes way when a window opens on the workspace.":
                "O que abre espaço quando uma janela é aberta no espaço de trabalho.",
            "What shows through a window, and what lifts it off the wallpaper.":
                "O que transparece pela janela e o que a destaca do papel de parede.",
            "What the bar and the island are made of.":
                "Do que são compostas a barra e a ilha.",
            "What the modules know, on the bar, the desktop and the panels.":
                "O que os módulos exibem na barra, na área de trabalho e nos painéis.",
            "Where the island meets the top edge, and what opens it.":
                "Onde a ilha encontra a borda superior e como ela é aberta.",
            "While arranging, click a widget to override these for it alone. Modern shows a figure with a caption, Analogue draws an object such as a dial or a gauge, and Sticker cuts it out as coloured stickers on the wallpaper; the ground and the background set what the first two are made of and how opaque.":
                "Durante a organização, clique em um widget para personalizar suas propriedades individuais. Moderno exibe um valor com legenda, Analógico desenha um medidor ou mostrador e Adesivo recorta formas coloridas sobre o papel de parede.",
            "With more screens": "Com múltiplas telas",
            "Your account, the lock screen, face unlock and idle behaviour.":
                "Sua conta, a tela de bloqueio, desbloqueio facial e comportamento de inatividade.",
            "Autostart": "Inicialização",
            "Startup Applications": "Aplicativos de Inicialização",
            "Applications and scripts launched automatically when you log in.":
                "Aplicativos e comandos iniciados automaticamente ao entrar na sessão.",
            "Assign each application to a specific workspace and display, so your desktop is arranged the moment you start.":
                "Defina o monitor e a área de trabalho de cada aplicativo para organizar seu espaço ao iniciar.",
            "No startup applications yet.": "Nenhum aplicativo na inicialização ainda.",
            "Any display": "Qualquer tela",
            "Launch now": "Iniciar agora",
            "Launch all": "Iniciar todos",
            "Test startup": "Testar inicialização",
            "Launch all enabled applications now": "Executa todos os aplicativos ativados agora.",
            "Add command": "Adicionar comando",
            "Command or script to run": "Comando ou script a executar",
            "Application name": "Nome do aplicativo",
            "Pick an installed application or enter a custom command.":
                "Escolha um aplicativo instalado ou digite um comando personalizado."
        }
    })
}
