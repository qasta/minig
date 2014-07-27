
app.controller('FolderListCtrl', function($scope, $rootScope, FolderResource) {
    $scope.folders = [];

    FolderResource.findAll().then(function (folders) {
        $scope.folders = folders;
    });

	$scope.reset = function() {
		$scope.query = null;
	};

    $scope.onFolderSelect = function(selectedFolder) {
       $rootScope.$broadcast('folder-intent', selectedFolder);
    };
})
.controller('MailOverviewCtrl', function($scope, $rootScope, $routeParams, $location, MailResource, i18nService, INITIAL_MAILBOX) {

	$scope.currentFolder = ($routeParams.id) ? $routeParams.id : INITIAL_MAILBOX;
	$scope.currentPage = 1;
	$scope.selected = [];
	$scope.folderIntent;
	$scope.data;

	function _getMails() {
	    return ($scope.data && $scope.data.mailList) ? $scope.data.mailList : [];
	};

    function _folderIntentDone() {
        $scope.updateOverview();
        $rootScope.$broadcast('folder-intent-done');
        $scope.folderIntent = null;
    }

    function _updateFlags(fnDecide) {
        var tmp = [];

        angular.forEach(getSelectedMails(), function(mail) {
            if(fnDecide(mail)) {
                tmp.push(mail);
            }

            mail.selected = false;
        });

        if(tmp.length > 0) {
           MailResource.updateFlags(tmp).$promise
           .catch(function() {
                $scope.updateOverview();
           });
        }

        $rootScope.$broadcast("more-actions-done");
    }

	function getSelectedMails() {
		var selected = [];

		angular.forEach(_getMails(), function(mail) {
			if(mail.selected) {
				selected.push(mail);
			}
		});

		return selected;
	}

	function selectAll(flag) {
		angular.forEach(_getMails(), function(mail) {
			mail.selected = flag;
		});
	}

    $scope.$on('folder-intent', function(e, folder) {
        var params = {folder: folder, mails: getSelectedMails()};

        switch($scope.folderIntent)    {
            case "copy": MailResource.copy(params).$promise.then(_folderIntentDone); break;
            case "move": MailResource.move(params).$promise.then(_folderIntentDone); break;
        }
    });

    $scope.$on('mark-as-read', function(e) {
        _updateFlags(function(mail) {
            if(!mail.read) {
                mail.read = true;
                return mail;
            }
        });
    });

    $scope.$on('mark-as-unread', function(e) {
        _updateFlags(function(mail) {
            if(mail.read) {
                mail.read = false;
                return mail;
            }
        });
    });

    $scope.$on('add-star', function(e) {
        _updateFlags(function(mail) {
            if(!mail.starred) {
                mail.starred = true;
                return mail;
            }
        });
    });

    $scope.$on('remove-star', function(e) {
        _updateFlags(function(mail) {
            if(mail.starred) {
                mail.starred = false;
                return mail;
            }
        });
    });

	$scope.updateOverview = function() {
		MailResource.findByFolder({
			folder: $scope.currentFolder,
			page: $scope.currentPage
		}).$promise
		.then(function(data) {
			$scope.data = data;
		});
	};

    $scope.moveToFolder = function() {
        $scope.folderIntent = "move";
    };

    $scope.copyToFolder = function() {
        $scope.folderIntent = "copy";
    };

	$scope.showIcon = function(mail) {
		return mail.answered || mail.forwarded;
	};

	$scope.whichIcon = function(mail) {
		if(mail.answered && mail.forwarded) {
			return "forwardedanswered";
		} else if(mail.answered) {
			return "answered";
		} else {
			return "forwarded"
		}
	};

	$scope.selectAll = function() {
		selectAll(true);
	};
	
	$scope.selectNone = function() {
		selectAll(false);
	};
	
	$scope.hasMailSelected = function() {
		return getSelectedMails().length !== 0;
	};
	
	$scope.deleteMails = function() {
		var selectedMails = getSelectedMails();

		MailResource.deleteMails(selectedMails).$promise
		.then(function() {
			$rootScope.$broadcast('notification', i18nService.resolve("Message(s) deleted"));
			updateOverview();			
		});
	};
	
	$scope.clickStar = function() {
		var mail = this.mail;		
		mail.starred = !mail.starred;
		
		MailResource.updateFlags(this.mail).$promise
		.catch(function() {
			mail.starred = !mail.starred;
		});
	};

    $scope.open = function(mail) {
        $location.url("/composer?id=" + mail.id);
    };

    $scope.updateOverview();
})
.controller('FolderSettingsCtrl', function($scope, $rootScope, FolderResource, INITIAL_MAILBOX) {


	FolderResource.findAll().then(function(folders) {
		$scope.folders = folders;
	});

	$scope.createFolder = function() {
     //   console.log(INITIAL_MAILBOX);
	 //   console.log($scope.newFolder);
	}

})
.controller('ComposerCtrl', function($scope) {

});