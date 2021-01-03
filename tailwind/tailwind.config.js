const colors = require('tailwindcss/colors')

module.exports = {
    purge: {
        mode: "all",
        content: ["./Web/View/**/*.hs", "./assets/**/*.css"],
    },
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {},
        colors: {
            transparent: 'transparent',
            current: 'currentColor',
            gray: colors.trueGray,
            red: colors.red,
            blue: colors.lightBlue,
            yellow: colors.amber,
            teal: colors.teal,
        }
    },
    variants: {
        extend: {},
    },
    plugins: [],
};
