import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { CvComponent } from './components/cv/cv.component';
import { HomepageComponent } from './components/homepage/homepage.component';

const routes: Routes = [
  { path: 'cv', component: CvComponent },
  { path: '**', component: HomepageComponent, pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
