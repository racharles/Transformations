# Transformations
A Processing sketch made for Media Arts at Webb to explore art with programming.\
Uses the colors of the pixels of an image to determine the behavior of particles that move in a system.
# Instructions
After downloading the files, open the transformations.pde file inside the transformations folder with [Processing](https://processing.org/download/) and click the play button to run the program.
### Replace with a different image
* find/make any low resolution image (about less than 200 pixels wide/long)
* add the picture to the data folder in transformations folder
* change l_res = loadImage("picture.jpg"); to the name of your picture ex. loadImage("monalisa.png")
* change size(600,500) to size(length of picture * 6, width of picture * 6)
    * note: size() only accepts integer values, not variables
### Using included images
* change loadImage("picture.jpg") to "picture1","picture2", etc
* uncomment the correct picture size ex. size(600,498,P2D); //picture: 6(100 x 83) and comment out every other size()
# Credits
* Murasaki's [Impressionist Blobs](https://codepen.io/murasaki/pen/BmOzMP)
* Daniel Shiffman's [processing tutorials](https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw)
* Ms. Horejsi
### Artwork
* picture: "Reflections of the blue rain" by Leonid Afremov ([website](https://afremov.com/en/))
* picture1: "Any Minute Now" by Aenami ([artstation](https://www.artstation.com/aenamiart))
* picture2: "Mona Lisa" by Leonardo da Vinci
* picture3: "Starry Night" by Van Gogh
