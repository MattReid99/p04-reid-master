# CocoaPods integration / JSON demo
For this project, I integrated my app with the Cocoapods framework 'Charts.' I used the framework
to assist in the creation of a sleek line graph to plot the data.

Typically, I use Alamofire as an API for routing server calls, but I used this project to experiment
with using iOS' native URLSessions. In my experience, Alamofire can be quite problematic if the encodings
aren't set up in advance, whereas with URLSessions, I did not experience any such issue. However, it is still
a fairly bulky segment of code in order to achieve a pretty simple task. 
