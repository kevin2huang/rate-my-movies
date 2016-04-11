define([
	'../userprofile/Profile',
	'../userprofile/Recent',
	'../userprofile/ReviewList',
	'../userprofile/SubscriptionList',
	'../userprofile/WatchLater',
	'../userprofile/Administrator',
	'text!ressources/js/pages/UserProfilePageTemplate.html',
	'knockout',
	'komapping',
	'jquery'
], function(Profile, Recent, ReviewList, SubscriptionList, WatchLater, Administrator, template, ko, komapping, $) {
	'use strict';

	$('#page-top').append(template);

	var UserProfilePage = function (user) {
		var self = this;

		self.text = "UserProfilePage";

		self.user = user;

		self.profiletabs = ko.observableArray([]);
		self.profiletabs().push(new WatchLater(self.user));
		self.profiletabs().push(new Recent(self.user));
		self.profiletabs().push(new ReviewList(self.user));
		self.profiletabs().push(new Profile(self.user));
		self.profiletabs().push(new SubscriptionList(self.user));
		self.profiletabs().push(new Administrator(self.user));

		self.profiletabsActive = ko.observable(self.profiletabs()[0]);

		self.modalMovie = ko.observable(null);
		self.modalReview = ko.observable(null);
		self.sendReview = function() {};
		self.setModalMovie = function (movie) {
			self.modalMovie(movie);
		};

		self.setActiveTab = function (tab) {
			self.profiletabsActive(tab);
		};
	};

	return UserProfilePage;

});