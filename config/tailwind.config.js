const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["IBM Plex Sans", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        vazBlue: {
          50: "#f4f7fd",
          100: "#d5e1f7",
          200: "#b1c6f0",
          300: "#84a6e7",
          400: "#6b94e2",
          500: "#487adb",
          600: "#2863d5",
          // 700 is base blue
          700: "#084CCF",
          800: "#073ea9",
          900: "#052d7b",
        },
        vazBeige: {
          50: "#F6F5F1",
        },
        vazBlack: {
          50: "#4B5361",
        },
        vazRed: {
          50: "#cf4808",
        },
        vazGreen: {
          50: "#08cf94",
        },
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
