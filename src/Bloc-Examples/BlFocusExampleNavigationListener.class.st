"
I am a keyboard arrow press listener used by focus examples in order to move focus between cell elements
"
Class {
	#name : #BlFocusExampleNavigationListener,
	#superclass : #BlEventListener,
	#category : #'Bloc-Examples-Focus'
}

{ #category : #'keyboard handlers' }
BlFocusExampleNavigationListener >> keyDownEvent: anEvent [
	| root focused focusFinder next direction |
	
	root := anEvent currentTarget.
	
	root hasFocus
		ifFalse: [ ^ self ].

	focused := root focusedChild.
	[ focused focusedChild isNotNil ]
		whileTrue: [ focused := focused focusedChild ].
	
	focusFinder := BlFocusFinder new.
	direction := nil.
	next := nil.
			
	anEvent key = BlKeyboardKey arrowLeft
		ifTrue: [ direction := BlFocusSearchDirectionLeft new ].
	anEvent key = BlKeyboardKey arrowUp
		ifTrue: [ direction := BlFocusSearchDirectionUp new ].
	anEvent key = BlKeyboardKey arrowRight
		ifTrue: [ direction := BlFocusSearchDirectionRight new ].
	anEvent key = BlKeyboardKey arrowDown
		ifTrue: [ direction := BlFocusSearchDirectionDown new ].
				
	next := direction ifNotNil: [ :aDirection |
		focusFinder
			direction: aDirection;
			root: root;
			referenceElement: focused;
			nextFocusDo: #yourself ifNone: [ nil ] ].
	next ifNotNil: #transferFocus
]
