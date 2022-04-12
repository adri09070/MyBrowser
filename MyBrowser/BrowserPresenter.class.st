Class {
	#name : #BrowserPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'packageList',
		'classList',
		'methodList',
		'codeDisplayer'
	],
	#category : #MyBrowser
}

{ #category : #'as yet unclassified' }
BrowserPresenter >> createClassList [

	classList
		headerTitle: 'Classes';
		display: [ :aClass | aClass name ];
		transmitDo: [ :aClass | 
			aClass ifNotNil: [ 
					methodList items: aClass methods asOrderedCollection ] 
		]
]

{ #category : #'as yet unclassified' }
BrowserPresenter >> createMethodList [

	methodList
		headerTitle: 'Methods';
		display: [ :aMethod | aMethod name ];
		transmitDo: [ :aMethod | 
			aMethod ifNotNil: [ 
					codeDisplayer text: aMethod codeForNoSource ] 
		]
]

{ #category : #'as yet unclassified' }
BrowserPresenter >> createPackageList [

	packageList
		headerTitle: 'Packages';
		items: RPackage organizer packages;
		display: [ :anRPackage | anRPackage name ];
		transmitDo: [ :anRPackage | 
			anRPackage ifNotNil: [ 
					classList items: anRPackage classes asOrderedCollection ] ]
]

{ #category : #'as yet unclassified' }
BrowserPresenter >> initializePresenters [

	super initializePresenters.

	packageList := self newList.
	classList := self newList.
	methodList := self newList.
	codeDisplayer := self newCode.

	self createPackageList.
	self createClassList.
	self createMethodList.

	self setLayout
]

{ #category : #initialization }
BrowserPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'MyBrowser';
		initialExtent: 500@500
]

{ #category : #'as yet unclassified' }
BrowserPresenter >> setLayout [

	self layout: (SpBoxLayout newVertical
			 	spacing: 5;
			 	add: (SpBoxLayout newHorizontal
					  spacing: 5;
					  add: packageList;
					  add: classList;
					  add: methodList;
					  yourself);
				add: codeDisplayer;
				yourself)
]
