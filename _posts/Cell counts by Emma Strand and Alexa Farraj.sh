#!/usr/bin/env bash

# This script is designed to create a markdown file that
# generates a formatted Jekyll header. It prompts the user
# for a phrase and that phrase is utilized in the name of
# the markdown file that is created.

# To run, copy this file to your desired directory.
# Change to the directory where you just copied this file.
# In a terminal prompt, type:. post_template.sh

# Set variables
POST_DATE=$20190723
MD_LINE="---"
LAYOUT="layout: post"
TITLE="Cell Counts by Emma Strand and Alexa Farraj "
DATE_LINE="date: 20190710"
CATEGORIES="categories: "
TAGS="tags: "


| Sample ID | Tech  | 1   | 2   | 3   | 4   | 5   | 6   | 7   |
|-----------|-------|-----|-----|-----|-----|-----|-----|-----|
| 415       | ES    | 376 | 332 | 363 | 312 | 346 | 357 | NA  |
| 262       | ES    | 430 | 443 | 453 | 449 | 390 | 419 | NA  |
| 424       | AF    | 244 | 295 | 256 | 298 | 214 | 283 | NA  |
| 271       | ES    | 520 | 495 | 616 | 481 | 463 | 441 | 508 |
| 208       | AF    | 416 | 411 | 438 | 445 | 433 | 449 | NA  |
| 406       | ES    | 182 | 189 | 160 | 199 | 189 | 197 | NA  |
| 154       | AF    | 348 | 336 | 350 | 342 | 374 | 356 | NA  |
| 73        | AF    | 240 | 270 | 230 | 235 | 225 | 250 | NA  |
| 64        | AF    | 294 | 277 | 281 | 260 | 310 | 282 | NA  |
| 28        | AF    | 364 | 344 | 421 | 402 | 439 | 498 | NA  |
| 244       | AF/ES | 34  | 42  | 36  | 44  | 42  | 38  | NA  |



# Ask user for input
echo "Enter title:"
read PHRASE
echo "You entered $PHRASE"

echo "Enter categories: (Analysis, Goals, Processing, Protocols)"
read PHRASE2
echo "You entered $PHRASE2"

echo "Enter tags: include []"
read PHRASE3
echo "You entered $PHRASE3"

# Remove spaces from PHRASE and replace with hyphens
FORMATTED_PHRASE="$(echo -ne "${PHRASE}" | tr [:space:] '-')"

# Save new filename using POST_DATE and FORMATTED_PHRASE variables.
NEW_MD_FILE="$(echo -n "${POST_DATE}"-"${FORMATTED_PHRASE}")".md


# Prints formatted Jekyll header utilizing POST_DATE and user-entered PHRASE.
# Writes contents to NEW_MD_FILE
printf "%s\n%s\n%s%s\n%s'%s'\n%s%s\n%s%s\n%s%s\n" "$MD_LINE" "$LAYOUT" "$TITLE" "$PHRASE" "$DATE_LINE" "$POST_DATE" "$CATEGORIES" "$PHRASE2" "$TAGS" "$PHRASE3" "$MD_LINE" >> \
"$NEW_MD_FILE"

# Opens NEW_MD_FILE in nano text editor for editing.
nano "$NEW_MD_FILE"


# Use git to stage, commit, and push NEW_MD_FILE to GitHub
git add "$NEW_MD_FILE"
git commit -m "created new post: $NEW_MD_FILE"
git push origin master
