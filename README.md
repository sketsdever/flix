# Project 2 - Movie Viewer

flix is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 16 hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [x] User sees an error message when there's a networking error.
- [ ] Movies are displayed using a CollectionView instead of a TableView.
- [x] User can search for a movie.
- [ ] All images fade in as they are loading.
- [x] Customize the UI.
- [x] Users can view a separate screen with the larger movie poster by clicking on the movie in tableView. the new screen uses scrollview and a slightly transparent frame to load the title and overview of the movie. The frame adjusts to the size of each movie's title and overview.
- [x] Added tab navigation at the bottom of the screen so users can view either now playing or top rated movies. Incorporated images from the noun project.

The following **additional** features are implemented:

- [x] Scroll view reveals hidden description including title, release date, and overview in the detail screen.
- [x] Embedded button in detail view that links to fandango so user can purchase tickets.
- [x] Customized selection effect of cell by disabling it on click and on return (so it isn't still highlighted after the user returns from the detail screen)
- [x] Customized navigation bars (top bar and bottom tabs) by adjusting colors, adding images, etc.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to change the color of the tab navigation bar (implemented in the app delegate file, not storyboard, wonder if this makes a difference).
2. Programatically resizing text labels.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/26BoCj1hWe9dfA4qQ/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

It was tricky trying to fix all the details of the UI at the end.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- play by Gregor Črešnar from the Noun Project
- Star by Marek Polakovic from the Noun Project
- Warning by Anton Gajdosik from the Noun Project
- upper right by Alfredo Hernandez from the Noun Project

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.