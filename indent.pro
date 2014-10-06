/**
 *  DETAILS: My indent configuration file.
 *  CREATED: 09/30/14 20:11:05 PDT
 * MODIFIED: 10/06/14 14:14:59 IST
 *
 *   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
 *  LICENSE: Copyright (c) 2014, Ravikiran K.S.
 */
/* comments */
--format-first-column-comments  /* -fc1. format comments in first column */
--format-all-comments           /* -fca. format all comments */

--comment-indentation33         /* -c33. comments on right start from column */
--else-endif-column33           /* -cp33. comments on right of #endif #else */
--declaration-comment-column33  /* -cd33. comments on right of declaration */

--start-left-side-of-comments   /* -sc. each line of comment starts with star */
--no-comment-delimiters-on-blank-lines  /* -ncdb. */

/* tab, level, length */
--no-tabs                       /* -nut. use space instead of tabs */

--tab-size4                     /* -ts4. tab size in spaces */
--indent-level4                 /* -i4. tab width in spaces */
--case-indentation4             /* -cli4. case label indentation */
--case-brace-indentation4       /* -cbi4. {} indentation in switch-case */
--declaration-indentation4      /* -di4. indent declarations to column */
--continuation-indentation0     /* -ci0. no extra indent on continued stmt. */
--line-comments-indentation0    /* -d0. no line comment indentation */

--line-length80                 /* -l80. text wrap margin for code */
--comment-line-length80         /* -lc80. text wrap margin for comments */
--honour-newlines               /* -hnl. break long lines around text wrap */

/* brackets, blanks, lines */
--cuddle-else                   /* -ce. else on same line as } */
--cuddle-do-while               /* -cdw. while on same line as } in do-while */
--space-after-if                /* -sai. space between if() and { */
--space-after-for               /* -saf. space between for() and { */
--space-after-while             /* -saw. space between while() and { */
--braces-on-if-line             /* -br. {} on same line as if */
--braces-after-func-def-line    /* -blf. {} always below func name */
--braces-on-struct-decl-line    /* -brs. {} on same line as struct declare */
--continue-at-parentheses       /* -lp. align func args at () of function */
--break-after-boolean-operator  /* -nbbo. break after boolean operator */

--blank-before-sizeof           /* -bs. blank between sizeof and its arg */
--blank-lines-after-procedures  /* -bap. After {} block */
--no-blank-lines-after-commas   /* -nbc. no line b/w comma separated values */
--no-blank-lines-after-declarations     /* -nbad */
--swallow-optional-blank-lines  /* -sob. delete extra blank lines */
--space-special-semicolon       /* -ss. for single semi-colon, add one space */
--no-space-after-casts          /* -ncs. no space b/w cast operator & value */
--no-space-after-parentheses    /* -nprs. no space after (, Or before ) */
--no-space-after-function-call-names    /* -npcs. no space between func & () */

--dont-break-procedure-type     /* -npsl. type of func on same line as decl. */
--preserve-mtime                /* -pmt. preserve modification times */

-T uint
-T ubyte
-T uchar
-T ulong
-T ushort
-T boolean
-T uint8_t
-T uint16_t
-T uint32_t
-T uint64_t
-T int8_t
-T int16_t
-T int32_t
-T int64_t
-T boolean_t
-T u_int8_t
-T u_int16_t
-T u_int32_t
-T u_int64_t
-T likely
-T unlikely
