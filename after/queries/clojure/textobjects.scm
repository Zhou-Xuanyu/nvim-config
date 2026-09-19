;; Every top-level form (defn, def, ns, comment, ...) counts as a "function"
;; so nvim-treesitter-textobjects motions ([[ ]] ][ [] ]f [f) work in Clojure.
(source (_) @function.outer)
