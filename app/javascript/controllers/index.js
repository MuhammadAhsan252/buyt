// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
import RailsNestedForm from '@stimulus-components/rails-nested-form'

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import RemoteModalController from "./remote_modal_controller"
application.register("remote-modal", RemoteModalController)
application.register('nested-form', RailsNestedForm)