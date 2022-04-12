Class {
	#name : #BrowserApplication,
	#superclass : #SpApplication,
	#category : #MyBrowser
}

{ #category : #accessing }
BrowserApplication >> start [

	| presenter |
	presenter := BrowserPresenter newApplication: self.
	presenter open
]
