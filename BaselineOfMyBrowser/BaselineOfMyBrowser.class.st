Class {
	#name : #BaselineOfMyBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyBrowser
}

{ #category : #baselines }
BaselineOfMyBrowser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec package: 'MyBrowser'
		]
]

{ #category : #baselines }
BaselineOfMyBrowser >> projectClass [
	^ MetacelloCypressBaselineProject
]
