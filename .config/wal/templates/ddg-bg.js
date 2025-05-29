// SYMLINK THIS INTO THE GREASEMONKEY FOLDER IN QUTEBROWSER
// --------------------------------------------------------

// Cookies string for your theme
const cookie = '7={background}; 9={foreground}; aa={foreground} 8={color1}; x={color2};';

// Converts cookie string into formatted JSON
const cookieToJSON = (cookieRaw) => {{
  const cookieJson = {{}};
  const items = cookieRaw.split(/[ ,]+/);

  items.forEach((item) => {{
    const parts = item.split('=');
    cookieJson[parts[0]] = parts[1];
  }});

  return cookieJson;
}};

// Iterates over JSON, and adds to browser cookie store
const setCookies = (cookieJson) => {{
  Object.keys(cookieJson).forEach((key) => {{
    document.cookie = `${{key}}=${{cookieJson[key]}}`;
  }});
}};

// Call set cookies, passing in formated cookie data
setCookies(cookieToJSON(cookie));
