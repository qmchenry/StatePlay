# StatePlay

Exploration on state management for SwiftUI including statecharts.

This is an early stage project to explore leveraging statecharts for state management in SwiftUI projects. It currently implements a static CD Player 
interface that mimics the UI presented in Constructing the book User Interface with Statecharts by Ian Horrocks. This book provides the inspiration for
and reasoning behind statecharts and their use in contexts like this.

The goal of this project is to implement a naive representation of all the state-related variables for this UI CD Player as variables in an observable
object stored in a StateObject, then to re-implement this approach in one or more statechart or state machine architectures, ideally implementing a 
true representation of the Horrocks appraoch. 

Currently, the project has a static UI for the CD Player as a starting point for other implementations as well as progress on the naive approach. While
UI looks simple, this approach rapidly reveals the complexity of managing intricate state interdependencies. 

Discussion and PRs are welcome.
