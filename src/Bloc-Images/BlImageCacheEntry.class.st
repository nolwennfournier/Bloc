"
BlImageCacheEntry is used to return a ${class:name=Form}$ from the ${class:name=BlLocalImageCache}$.

It includes two flags:

- isOriginal: which indicates that the form is from the source, and thus no larger form is available.
- isSmallest: which indicates that the form is the smallest held by the cache.

These allow the user to determine whether it is worthwhile attempting to get a smaller or larger version of the form from the cache.

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	image:				<SkImage>
	isOriginal:		<Boolean>
	isSmallest:		<Boolean>


"
Class {
	#name : #BlImageCacheEntry,
	#superclass : #Object,
	#instVars : [
		'image',
		'isSmallest',
		'isOriginal'
	],
	#category : #'Bloc-Images-Cache'
}

{ #category : #accessing }
BlImageCacheEntry >> image [
	^ image
]

{ #category : #accessing }
BlImageCacheEntry >> image: anObject [
	image := anObject
]

{ #category : #accessing }
BlImageCacheEntry >> isOriginal [
	^ isOriginal
]

{ #category : #accessing }
BlImageCacheEntry >> isOriginal: anObject [
	isOriginal := anObject
]

{ #category : #accessing }
BlImageCacheEntry >> isSmallest [
	^ isSmallest
]

{ #category : #accessing }
BlImageCacheEntry >> isSmallest: anObject [
	isSmallest := anObject
]
