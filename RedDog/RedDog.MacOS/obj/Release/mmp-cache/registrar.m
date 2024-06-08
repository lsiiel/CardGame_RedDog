#include <xamarin/xamarin.h>
#include "registrar.h"
extern "C" {
static id native_to_managed_trampoline_1 (id self, SEL _cmd, MonoMethod **managed_method_ptr, bool* call_super, uint32_t token_ref)
{
	MonoClass *declaring_type = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	bool has_nsobject = xamarin_has_nsobject (self, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	if (has_nsobject) {
		*call_super = true;
		goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	declaring_type = mono_method_get_class (managed_method);
	mthis = xamarin_new_nsobject (self, declaring_type, &exception_gchandle);
	xamarin_mono_object_release (&declaring_type);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return self;
}


static void native_to_managed_trampoline_2 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_3 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_4 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, void * p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	void * a2 = p2;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &a2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_5 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_6 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_7 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_8 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_9 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, double p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	NSObject *nsobj4 = NULL;
	MonoObject *mobj4 = NULL;
	int32_t created4 = false;
	MonoType *paramtype4 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;
	nsobj4 = (NSObject *) p4;
	if (nsobj4) {
		paramtype4 = xamarin_get_parameter_type (managed_method, 4);
		mobj4 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj4, false, paramtype4, &created4, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype4, 4, true);
			goto exception_handling;
		}
	}
	arg_ptrs [4] = mobj4;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramtype4);
	xamarin_mono_object_release (&mobj4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_10 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	NSObject *nsobj4 = NULL;
	MonoObject *mobj4 = NULL;
	int32_t created4 = false;
	MonoType *paramtype4 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;
	nsobj4 = (NSObject *) p4;
	if (nsobj4) {
		paramtype4 = xamarin_get_parameter_type (managed_method, 4);
		mobj4 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj4, false, paramtype4, &created4, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype4, 4, true);
			goto exception_handling;
		}
	}
	arg_ptrs [4] = mobj4;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramtype4);
	xamarin_mono_object_release (&mobj4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_11 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	NSObject *nsobj4 = NULL;
	MonoObject *mobj4 = NULL;
	int32_t created4 = false;
	MonoType *paramtype4 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;
	nsobj4 = (NSObject *) p4;
	if (nsobj4) {
		paramtype4 = xamarin_get_parameter_type (managed_method, 4);
		mobj4 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj4, false, paramtype4, &created4, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype4, 4, true);
			goto exception_handling;
		}
	}
	arg_ptrs [4] = mobj4;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramtype4);
	xamarin_mono_object_release (&mobj4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_12 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoString *a3 = NULL;
	NSObject *nsobj4 = NULL;
	MonoObject *mobj4 = NULL;
	int32_t created4 = false;
	MonoType *paramtype4 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	a3 = xamarin_nsstring_to_string (NULL, p3);
	arg_ptrs [3] = a3;
	nsobj4 = (NSObject *) p4;
	if (nsobj4) {
		paramtype4 = xamarin_get_parameter_type (managed_method, 4);
		mobj4 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj4, false, paramtype4, &created4, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype4, 4, true);
			goto exception_handling;
		}
	}
	arg_ptrs [4] = mobj4;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&a3);
	xamarin_mono_object_release (&paramtype4);
	xamarin_mono_object_release (&mobj4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static id native_to_managed_trampoline_13 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_14 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_15 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, BOOL p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSUInteger native_to_managed_trampoline_16 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_17 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *del2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	if (p2) {
		del2 = xamarin_get_delegate_for_block_parameter (managed_method, 0xD4720 /* AppKit.ContinueUserActivityRestorationHandler ObjCRuntime.Trampolines/NIDContinueUserActivityRestorationHandler::Create(System.IntPtr) */ , 2, p2, &exception_gchandle);
		arg_ptrs [2] = del2;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [2] = NULL;
	}

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&del2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_18 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_19 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSArray * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	marr1 = xamarin_nsarray_to_managed_string_array (arr1, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_20 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	MonoType *paramtype1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	paramtype1 = xamarin_get_parameter_type (managed_method, 1);
	marr1 = xamarin_nsarray_to_managed_nsobject_array (arr1, paramtype1, NULL, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static NSUInteger native_to_managed_trampoline_21 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSArray * p1, id p2, BOOL p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	marr1 = xamarin_nsarray_to_managed_string_array (arr1, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	arg_ptrs [3] = &p3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_22 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSArray * p0, NSArray * p1, uint32_t token_ref)
{
	MonoArray *marr0 = NULL;
	NSArray *arr0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arr0 = p0;
	marr0 = xamarin_nsarray_to_managed_string_array (arr0, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = marr0;
	arr1 = p1;
	marr1 = xamarin_nsarray_to_managed_string_array (arr1, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&marr0);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static id native_to_managed_trampoline_23 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_24 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSArray * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	marr1 = xamarin_nsarray_to_managed_string_array (arr1, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_25 (id self, SEL _cmd, MonoMethod **managed_method_ptr, SEL p0, uint32_t token_ref)
{
	MonoObject *a0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	a0 = p0 ? xamarin_get_selector (p0, &exception_gchandle) : NULL;
	arg_ptrs [0] = a0;
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&a0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_26 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_27 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static id native_to_managed_trampoline_28 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSInteger native_to_managed_trampoline_29 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, NSInteger p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a3 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &p2;
	a3 = xamarin_nsstring_to_string (NULL, p3);
	arg_ptrs [3] = a3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a3);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGFloat native_to_managed_trampoline_30 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGFloat res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGFloat *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_31 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		res = xamarin_string_to_nsstring ((MonoString *) retval, false);
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_32 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, CGRect* p2, id p3, NSInteger p4, CGPoint p5, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [6];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = p2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;
	arg_ptrs [4] = &p4;
	arg_ptrs [5] = &p5;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_33 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_34 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	long long nativeEnum2 = p2;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &nativeEnum2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_35 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_36 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_37 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_38 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, NSInteger p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	arg_ptrs [3] = &p3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_39 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoString *a2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	a2 = xamarin_nsstring_to_string (NULL, p2);
	arg_ptrs [2] = a2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_40 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, NSInteger p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	arg_ptrs [3] = &p3;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_41 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoString *a2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	a2 = xamarin_nsstring_to_string (NULL, p2);
	arg_ptrs [2] = a2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_42 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoString *a2 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	a2 = xamarin_nsstring_to_string (NULL, p2);
	arg_ptrs [2] = a2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_43 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, SEL p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *a2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	a2 = p2 ? xamarin_get_selector (p2, &exception_gchandle) : NULL;
	arg_ptrs [2] = a2;
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_44 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSRange p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSArray * native_to_managed_trampoline_45 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSArray * p2, NSRange p3, NSInteger* p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoArray *marr2 = NULL;
	NSArray *arr2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSArray * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arr2 = p2;
	marr2 = xamarin_nsarray_to_managed_string_array (arr2, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [2] = marr2;
	arg_ptrs [3] = &p3;
	arg_ptrs [4] = p4;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_string_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&marr2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_46 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, NSRange p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoArray *marr2 = NULL;
	NSArray *arr2 = NULL;
	MonoType *paramtype2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arr2 = p2;
	paramtype2 = xamarin_get_parameter_type (managed_method, 2);
	marr2 = xamarin_nsarray_to_managed_nsobject_array (arr2, paramtype2, NULL, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [2] = marr2;
	arg_ptrs [3] = &p3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&marr2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_47 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSUInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_48 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_49 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, CGPoint p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_50 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_51 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, double p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static CGRect native_to_managed_trampoline_52 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, CGRect p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGSize native_to_managed_trampoline_53 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGSize p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGSize native_to_managed_trampoline_54 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGSize p1, CGSize p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSUInteger native_to_managed_trampoline_55 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSUInteger p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	unsigned long long nativeEnum1 = p1;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &nativeEnum1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGRect native_to_managed_trampoline_56 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_57 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id* p1, double p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *mobj1 = NULL;
	MonoObject *mobj_out1 = NULL;
	NSObject *nsobj1 = NULL;
	MonoType *paramtype1 = NULL;
	void * handle1 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	if (p1 != NULL)
		nsobj1 = *(NSObject **) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr (nsobj1, false, paramtype1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the byref parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	mobj_out1 = mobj1;
	arg_ptrs [1] = (int *) &mobj_out1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (mobj_out1 != NULL) {
		handle1 = xamarin_get_nsobject_handle (mobj_out1);
		xamarin_mono_object_release (&mobj_out1);
	}
	if (p1 != NULL)
		*p1 = (id) handle1;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static CGRect native_to_managed_trampoline_58 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_59 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		res = xamarin_string_to_nsstring ((MonoString *) retval, false);
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_60 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSArray * native_to_managed_trampoline_61 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSArray * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = xamarin_managed_string_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_62 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSInteger p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_63 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, BOOL p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoString *a1 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_64 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, NULL, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_65 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static CGSize native_to_managed_trampoline_66 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGSize p0, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGRect native_to_managed_trampoline_67 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGRect native_to_managed_trampoline_68 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect p1, CGRect p2, NSInteger p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = &p2;
	arg_ptrs [3] = &p3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_69 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_generic_method_from_token (mthis, token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_70 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_generic_method_from_token (mthis, token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_71 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, BOOL p1, uint32_t token_ref)
{
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static NSInteger native_to_managed_trampoline_72 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_73 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_74 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, void * p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	void * a3 = p3;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	arg_ptrs [3] = &a3;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_75 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	MonoType *type0;
	MonoObject *inobj0 = NULL;
	MonoReflectionType *reflectiontype0 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	type0 = xamarin_get_parameter_type (managed_method, 0);
	reflectiontype0 = mono_type_get_object (mono_domain_get (), type0);
	inobj0 = xamarin_get_inative_object_dynamic (p0, false, reflectiontype0, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = inobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&type0);
	xamarin_mono_object_release (&inobj0);
	xamarin_mono_object_release (&reflectiontype0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_76 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoObject *inobj4 = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
	}
	arg_ptrs [3] = mobj3;
	inobj4 = xamarin_get_inative_object_static (p4, false, 0x1C20 /* WebKit.IWebPolicyDecisionListener */, 0x1E20 /* WebKit.WebPolicyDecisionListenerWrapper */, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [4] = inobj4;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&inobj4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static NSInteger native_to_managed_trampoline_77 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_78 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSInteger p0, uint32_t token_ref)
{
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static CGRect native_to_managed_trampoline_79 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
	}
	arg_ptrs [2] = mobj2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static CGSize native_to_managed_trampoline_80 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}




#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation WebFrameLoadDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x18F20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation CoreImage_CIColorCrossPolynomial {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) setRedCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1F720);
	}

	-(void) setGreenCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1F820);
	}

	-(void) setBlueCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1F920);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation CoreImage_CIColorPolynomial {
}

	-(void) setRedCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1FC20);
	}

	-(void) setGreenCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1FD20);
	}

	-(void) setBlueCoefficients:(CIVector *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x1FE20);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1FA20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [CoreImage_CIColorCrossPolynomial class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __monomac_internal_ActionDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) __monomac_internal_ActionDispatcher_activated:(NSObject *)p0;
	-(void) __monomac_internal_ActionDispatcher_doubleActivated:(NSObject *)p0;
	-(BOOL) worksWhenModal;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation __monomac_internal_ActionDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) __monomac_internal_ActionDispatcher_activated:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3AD20);
	}

	-(void) __monomac_internal_ActionDispatcher_doubleActivated:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3AE20);
	}

	-(BOOL) worksWhenModal
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x3B220);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3AF20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSAlertDidEndDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) alertDidEnd:(NSAlert *)p0 returnCode:(NSInteger)p1 contextInfo:(void *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation __MonoMac_NSAlertDidEndDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) alertDidEnd:(NSAlert *)p0 returnCode:(NSInteger)p1 contextInfo:(void *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, p2, 0x45A20);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation NSApplicationDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F920);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation NSPageControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x80F20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation NSTableViewSource {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8C920);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation NSToolbarDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x91F20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Foundation_NSDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Foundation_NSDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xDFD20);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xDFC20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSSynchronizationContextDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xE0020);
	}
@end

@interface __Xamarin_NSTimerActionDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) xamarinFireSelector:(NSTimer *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation __Xamarin_NSTimerActionDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) xamarinFireSelector:(NSTimer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0xE0220);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Foundation_NSAsyncDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
	-(id) init;
@end

@implementation Foundation_NSAsyncDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xE0520);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xE0420);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Foundation_NSDispatcher class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSAsyncActionDispatcher : Foundation_NSAsyncDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSAsyncActionDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xE0720);
	}
@end

@interface __MonoMac_NSAsyncSynchronizationContextDispatcher : Foundation_NSAsyncDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSAsyncSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xE0920);
	}
@end

@interface Foundation_InternalNSNotificationHandler : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) post:(NSNotification *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Foundation_InternalNSNotificationHandler {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) post:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0xF2020);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface WebKit_WebView__WebFrameLoadDelegate : NSObject<WebFrameLoadDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) webView:(WebView *)p0 didCancelClientRedirectForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didChangeLocationWithinPageForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didClearWindowObject:(WebScriptObject *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didCommitLoadForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didCreateJavaScriptContext:(JSContext *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didFailLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didFailProvisionalLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didFinishLoadForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didReceiveIcon:(NSImage *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didReceiveServerRedirectForProvisionalLoadForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didReceiveTitle:(NSString *)p1 forFrame:(WebFrame *)p2;
	-(void) webView:(WebView *)p0 didStartProvisionalLoadForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 willCloseFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 willPerformClientRedirectToURL:(NSURL *)p1 delay:(double)p2 fireDate:(NSDate *)p3 forFrame:(WebFrame *)p4;
	-(void) webView:(WebView *)p0 windowScriptObjectAvailable:(WebScriptObject *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation WebKit_WebView__WebFrameLoadDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) webView:(WebView *)p0 didCancelClientRedirectForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x17B20);
	}

	-(void) webView:(WebView *)p0 didChangeLocationWithinPageForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x17C20);
	}

	-(void) webView:(WebView *)p0 didClearWindowObject:(WebScriptObject *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x17D20);
	}

	-(void) webView:(WebView *)p0 didCommitLoadForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x17E20);
	}

	-(void) webView:(WebView *)p0 didCreateJavaScriptContext:(JSContext *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x17F20);
	}

	-(void) webView:(WebView *)p0 didFailLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x18020);
	}

	-(void) webView:(WebView *)p0 didFailProvisionalLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x18120);
	}

	-(void) webView:(WebView *)p0 didFinishLoadForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x18220);
	}

	-(void) webView:(WebView *)p0 didReceiveIcon:(NSImage *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x18320);
	}

	-(void) webView:(WebView *)p0 didReceiveServerRedirectForProvisionalLoadForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x18420);
	}

	-(void) webView:(WebView *)p0 didReceiveTitle:(NSString *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, p2, 0x18520);
	}

	-(void) webView:(WebView *)p0 didStartProvisionalLoadForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x18620);
	}

	-(void) webView:(WebView *)p0 willCloseFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x18720);
	}

	-(void) webView:(WebView *)p0 willPerformClientRedirectToURL:(NSURL *)p1 delay:(double)p2 fireDate:(NSDate *)p3 forFrame:(WebFrame *)p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x18820);
	}

	-(void) webView:(WebView *)p0 windowScriptObjectAvailable:(WebScriptObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x18920);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface WebKit_WebView__WebPolicyDelegate : NSObject<WebPolicyDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) webView:(WebView *)p0 decidePolicyForMIMEType:(NSString *)p1 request:(NSURLRequest *)p2 frame:(WebFrame *)p3 decisionListener:(NSObject *)p4;
	-(void) webView:(WebView *)p0 decidePolicyForNavigationAction:(NSDictionary *)p1 request:(NSURLRequest *)p2 frame:(WebFrame *)p3 decisionListener:(NSObject *)p4;
	-(void) webView:(WebView *)p0 decidePolicyForNewWindowAction:(NSDictionary *)p1 request:(NSURLRequest *)p2 newFrameName:(NSString *)p3 decisionListener:(NSObject *)p4;
	-(void) webView:(WebView *)p0 unableToImplementPolicyWithError:(NSError *)p1 frame:(WebFrame *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation WebKit_WebView__WebPolicyDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) webView:(WebView *)p0 decidePolicyForMIMEType:(NSString *)p1 request:(NSURLRequest *)p2 frame:(WebFrame *)p3 decisionListener:(NSObject *)p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x18A20);
	}

	-(void) webView:(WebView *)p0 decidePolicyForNavigationAction:(NSDictionary *)p1 request:(NSURLRequest *)p2 frame:(WebFrame *)p3 decisionListener:(NSObject *)p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x18B20);
	}

	-(void) webView:(WebView *)p0 decidePolicyForNewWindowAction:(NSDictionary *)p1 request:(NSURLRequest *)p2 newFrameName:(NSString *)p3 decisionListener:(NSObject *)p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x18C20);
	}

	-(void) webView:(WebView *)p0 unableToImplementPolicyWithError:(NSError *)p1 frame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x18D20);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface AppKit_NSApplication__NSApplicationDelegate : NSObject<NSApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSMenu *) applicationDockMenu:(NSApplication *)p0;
	-(BOOL) applicationOpenUntitledFile:(NSApplication *)p0;
	-(BOOL) applicationShouldHandleReopen:(NSApplication *)p0 hasVisibleWindows:(BOOL)p1;
	-(BOOL) applicationShouldOpenUntitledFile:(NSApplication *)p0;
	-(NSUInteger) applicationShouldTerminate:(NSApplication *)p0;
	-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)p0;
	-(BOOL) application:(NSApplication *)p0 continueUserActivity:(NSUserActivity *)p1 restorationHandler:(void (^)(id *))p2;
	-(void) application:(NSApplication *)p0 didDecodeRestorableState:(NSCoder *)p1;
	-(void) applicationDidBecomeActive:(NSNotification *)p0;
	-(void) applicationDidFinishLaunching:(NSNotification *)p0;
	-(void) applicationDidHide:(NSNotification *)p0;
	-(void) applicationDidResignActive:(NSNotification *)p0;
	-(void) applicationDidUnhide:(NSNotification *)p0;
	-(void) applicationDidUpdate:(NSNotification *)p0;
	-(void) application:(NSApplication *)p0 didFailToContinueUserActivityWithType:(NSString *)p1 error:(NSError *)p2;
	-(void) application:(NSApplication *)p0 didFailToRegisterForRemoteNotificationsWithError:(NSError *)p1;
	-(BOOL) application:(NSApplication *)p0 delegateHandlesKey:(NSString *)p1;
	-(BOOL) application:(NSApplication *)p0 openFile:(NSString *)p1;
	-(BOOL) application:(NSObject *)p0 openFileWithoutUI:(NSString *)p1;
	-(void) application:(NSApplication *)p0 openFiles:(NSArray *)p1;
	-(BOOL) application:(NSApplication *)p0 openTempFile:(NSString *)p1;
	-(void) application:(NSApplication *)p0 openURLs:(NSArray *)p1;
	-(void) orderFrontStandardAboutPanel:(NSObject *)p0;
	-(void) orderFrontStandardAboutPanelWithOptions:(NSDictionary *)p0;
	-(BOOL) application:(NSApplication *)p0 printFile:(NSString *)p1;
	-(NSUInteger) application:(NSApplication *)p0 printFiles:(NSArray *)p1 withSettings:(NSDictionary *)p2 showPrintPanels:(BOOL)p3;
	-(void) applicationProtectedDataDidBecomeAvailable:(NSNotification *)p0;
	-(void) applicationProtectedDataWillBecomeUnavailable:(NSNotification *)p0;
	-(BOOL) readSelectionFromPasteboard:(NSPasteboard *)p0;
	-(void) application:(NSApplication *)p0 didReceiveRemoteNotification:(NSDictionary *)p1;
	-(void) registerServicesMenuSendTypes:(NSArray *)p0 returnTypes:(NSArray *)p1;
	-(void) application:(NSApplication *)p0 didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)p1;
	-(void) applicationDidChangeScreenParameters:(NSNotification *)p0;
	-(void) application:(NSApplication *)p0 didUpdateUserActivity:(NSUserActivity *)p1;
	-(void) application:(NSApplication *)p0 userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)p1;
	-(void) applicationWillBecomeActive:(NSNotification *)p0;
	-(BOOL) application:(NSApplication *)p0 willContinueUserActivityWithType:(NSString *)p1;
	-(void) application:(NSApplication *)p0 willEncodeRestorableState:(NSCoder *)p1;
	-(void) applicationWillFinishLaunching:(NSNotification *)p0;
	-(void) applicationWillHide:(NSNotification *)p0;
	-(NSError *) application:(NSApplication *)p0 willPresentError:(NSError *)p1;
	-(void) applicationWillResignActive:(NSNotification *)p0;
	-(void) applicationWillTerminate:(NSNotification *)p0;
	-(void) applicationWillUnhide:(NSNotification *)p0;
	-(void) applicationWillUpdate:(NSNotification *)p0;
	-(BOOL) writeSelectionToPasteboard:(NSPasteboard *)p0 types:(NSArray *)p1;
	-(BOOL) respondsToSelector:(SEL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation AppKit_NSApplication__NSApplicationDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSMenu *) applicationDockMenu:(NSApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x3D320);
	}

	-(BOOL) applicationOpenUntitledFile:(NSApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x3D420);
	}

	-(BOOL) applicationShouldHandleReopen:(NSApplication *)p0 hasVisibleWindows:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, p0, p1, 0x3D520);
	}

	-(BOOL) applicationShouldOpenUntitledFile:(NSApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x3D620);
	}

	-(NSUInteger) applicationShouldTerminate:(NSApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, 0x3D720);
	}

	-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x3D820);
	}

	-(BOOL) application:(NSApplication *)p0 continueUserActivity:(NSUserActivity *)p1 restorationHandler:(void (^)(id *))p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, p0, p1, p2, 0x3D920);
	}

	-(void) application:(NSApplication *)p0 didDecodeRestorableState:(NSCoder *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3DA20);
	}

	-(void) applicationDidBecomeActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3DB20);
	}

	-(void) applicationDidFinishLaunching:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3DC20);
	}

	-(void) applicationDidHide:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3DD20);
	}

	-(void) applicationDidResignActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3DE20);
	}

	-(void) applicationDidUnhide:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3DF20);
	}

	-(void) applicationDidUpdate:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3E020);
	}

	-(void) application:(NSApplication *)p0 didFailToContinueUserActivityWithType:(NSString *)p1 error:(NSError *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, p2, 0x3E120);
	}

	-(void) application:(NSApplication *)p0 didFailToRegisterForRemoteNotificationsWithError:(NSError *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3E220);
	}

	-(BOOL) application:(NSApplication *)p0 delegateHandlesKey:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3E320);
	}

	-(BOOL) application:(NSApplication *)p0 openFile:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3E420);
	}

	-(BOOL) application:(NSObject *)p0 openFileWithoutUI:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3E520);
	}

	-(void) application:(NSApplication *)p0 openFiles:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_19 (self, _cmd, &managed_method, p0, p1, 0x3E620);
	}

	-(BOOL) application:(NSApplication *)p0 openTempFile:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3E720);
	}

	-(void) application:(NSApplication *)p0 openURLs:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x3E820);
	}

	-(void) orderFrontStandardAboutPanel:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3E920);
	}

	-(void) orderFrontStandardAboutPanelWithOptions:(NSDictionary *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3EA20);
	}

	-(BOOL) application:(NSApplication *)p0 printFile:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3EB20);
	}

	-(NSUInteger) application:(NSApplication *)p0 printFiles:(NSArray *)p1 withSettings:(NSDictionary *)p2 showPrintPanels:(BOOL)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_21 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x3EC20);
	}

	-(void) applicationProtectedDataDidBecomeAvailable:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3ED20);
	}

	-(void) applicationProtectedDataWillBecomeUnavailable:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3EE20);
	}

	-(BOOL) readSelectionFromPasteboard:(NSPasteboard *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x3EF20);
	}

	-(void) application:(NSApplication *)p0 didReceiveRemoteNotification:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3F020);
	}

	-(void) registerServicesMenuSendTypes:(NSArray *)p0 returnTypes:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, 0x3F120);
	}

	-(void) application:(NSApplication *)p0 didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3F220);
	}

	-(void) applicationDidChangeScreenParameters:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3F320);
	}

	-(void) application:(NSApplication *)p0 didUpdateUserActivity:(NSUserActivity *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3F420);
	}

	-(void) application:(NSApplication *)p0 userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3F520);
	}

	-(void) applicationWillBecomeActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3F620);
	}

	-(BOOL) application:(NSApplication *)p0 willContinueUserActivityWithType:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, p1, 0x3F720);
	}

	-(void) application:(NSApplication *)p0 willEncodeRestorableState:(NSCoder *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x3F820);
	}

	-(void) applicationWillFinishLaunching:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3F920);
	}

	-(void) applicationWillHide:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3FA20);
	}

	-(NSError *) application:(NSApplication *)p0 willPresentError:(NSError *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x3FB20);
	}

	-(void) applicationWillResignActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3FC20);
	}

	-(void) applicationWillTerminate:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3FD20);
	}

	-(void) applicationWillUnhide:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3FE20);
	}

	-(void) applicationWillUpdate:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3FF20);
	}

	-(BOOL) writeSelectionToPasteboard:(NSPasteboard *)p0 types:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, p0, p1, 0x40020);
	}

	-(BOOL) respondsToSelector:(SEL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x40120);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface AppKit_NSTableView__NSTableViewDelegate : NSObject<NSTableViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) tableViewColumnDidMove:(NSNotification *)p0;
	-(void) tableViewColumnDidResize:(NSNotification *)p0;
	-(NSTableRowView *) tableView:(NSTableView *)p0 rowViewForRow:(NSInteger)p1;
	-(void) tableView:(NSTableView *)p0 didAddRowView:(NSTableRowView *)p1 forRow:(NSInteger)p2;
	-(void) tableView:(NSTableView *)p0 didClickTableColumn:(NSTableColumn *)p1;
	-(void) tableView:(NSTableView *)p0 didDragTableColumn:(NSTableColumn *)p1;
	-(void) tableView:(NSTableView *)p0 didRemoveRowView:(NSTableRowView *)p1 forRow:(NSInteger)p2;
	-(NSCell *) tableView:(NSTableView *)p0 dataCellForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(NSInteger) tableView:(NSTableView *)p0 nextTypeSelectMatchFromRow:(NSInteger)p1 toRow:(NSInteger)p2 forString:(NSString *)p3;
	-(CGFloat) tableView:(NSTableView *)p0 heightOfRow:(NSInteger)p1;
	-(NSString *) tableView:(NSTableView *)p0 typeSelectStringForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(NSIndexSet *) tableView:(NSTableView *)p0 selectionIndexesForProposedSelection:(NSIndexSet *)p1;
	-(CGFloat) tableView:(NSTableView *)p0 sizeToFitWidthOfColumn:(NSInteger)p1;
	-(NSString *) tableView:(NSTableView *)p0 toolTipForCell:(NSCell *)p1 rect:(CGRect*)p2 tableColumn:(NSTableColumn *)p3 row:(NSInteger)p4 mouseLocation:(CGPoint)p5;
	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(BOOL) tableView:(NSTableView *)p0 isGroupRow:(NSInteger)p1;
	-(void) tableView:(NSTableView *)p0 mouseDownInHeaderOfTableColumn:(NSTableColumn *)p1;
	-(NSArray *) tableView:(NSTableView *)p0 rowActionsForRow:(NSInteger)p1 edge:(NSInteger)p2;
	-(void) tableViewSelectionDidChange:(NSNotification *)p0;
	-(void) tableViewSelectionIsChanging:(NSNotification *)p0;
	-(BOOL) selectionShouldChangeInTableView:(NSTableView *)p0;
	-(BOOL) tableView:(NSTableView *)p0 shouldEditTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(BOOL) tableView:(NSTableView *)p0 shouldReorderColumn:(NSInteger)p1 toColumn:(NSInteger)p2;
	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1;
	-(BOOL) tableView:(NSTableView *)p0 shouldSelectTableColumn:(NSTableColumn *)p1;
	-(BOOL) tableView:(NSTableView *)p0 shouldShowCellExpansionForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(BOOL) tableView:(NSTableView *)p0 shouldTrackCell:(NSCell *)p1 forTableColumn:(NSTableColumn *)p2 row:(NSInteger)p3;
	-(BOOL) tableView:(NSTableView *)p0 shouldTypeSelectForEvent:(NSEvent *)p1 withCurrentSearchString:(NSString *)p2;
	-(void) tableView:(NSTableView *)p0 willDisplayCell:(NSObject *)p1 forTableColumn:(NSTableColumn *)p2 row:(NSInteger)p3;
	-(BOOL) respondsToSelector:(SEL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation AppKit_NSTableView__NSTableViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) tableViewColumnDidMove:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x43020);
	}

	-(void) tableViewColumnDidResize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x43120);
	}

	-(NSTableRowView *) tableView:(NSTableView *)p0 rowViewForRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, p0, p1, 0x43220);
	}

	-(void) tableView:(NSTableView *)p0 didAddRowView:(NSTableRowView *)p1 forRow:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, p1, p2, 0x43320);
	}

	-(void) tableView:(NSTableView *)p0 didClickTableColumn:(NSTableColumn *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x43420);
	}

	-(void) tableView:(NSTableView *)p0 didDragTableColumn:(NSTableColumn *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x43520);
	}

	-(void) tableView:(NSTableView *)p0 didRemoveRowView:(NSTableRowView *)p1 forRow:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, p1, p2, 0x43620);
	}

	-(NSCell *) tableView:(NSTableView *)p0 dataCellForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, p2, 0x43720);
	}

	-(NSInteger) tableView:(NSTableView *)p0 nextTypeSelectMatchFromRow:(NSInteger)p1 toRow:(NSInteger)p2 forString:(NSString *)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x43820);
	}

	-(CGFloat) tableView:(NSTableView *)p0 heightOfRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, p1, 0x43920);
	}

	-(NSString *) tableView:(NSTableView *)p0 typeSelectStringForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, p1, p2, 0x43A20);
	}

	-(NSIndexSet *) tableView:(NSTableView *)p0 selectionIndexesForProposedSelection:(NSIndexSet *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x43B20);
	}

	-(CGFloat) tableView:(NSTableView *)p0 sizeToFitWidthOfColumn:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, p1, 0x43C20);
	}

	-(NSString *) tableView:(NSTableView *)p0 toolTipForCell:(NSCell *)p1 rect:(CGRect*)p2 tableColumn:(NSTableColumn *)p3 row:(NSInteger)p4 mouseLocation:(CGPoint)p5
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_32 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, p5, 0x43D20);
	}

	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, p2, 0x43E20);
	}

	-(BOOL) tableView:(NSTableView *)p0 isGroupRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, 0x43F20);
	}

	-(void) tableView:(NSTableView *)p0 mouseDownInHeaderOfTableColumn:(NSTableColumn *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x44020);
	}

	-(NSArray *) tableView:(NSTableView *)p0 rowActionsForRow:(NSInteger)p1 edge:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_34 (self, _cmd, &managed_method, p0, p1, p2, 0x44120);
	}

	-(void) tableViewSelectionDidChange:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x44220);
	}

	-(void) tableViewSelectionIsChanging:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x44320);
	}

	-(BOOL) selectionShouldChangeInTableView:(NSTableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x44420);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldEditTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x44520);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldReorderColumn:(NSInteger)p1 toColumn:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, p1, p2, 0x44620);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, 0x44720);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldSelectTableColumn:(NSTableColumn *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x44820);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldShowCellExpansionForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x44920);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldTrackCell:(NSCell *)p1 forTableColumn:(NSTableColumn *)p2 row:(NSInteger)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_38 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x44A20);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldTypeSelectForEvent:(NSEvent *)p1 withCurrentSearchString:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_39 (self, _cmd, &managed_method, p0, p1, p2, 0x44B20);
	}

	-(void) tableView:(NSTableView *)p0 willDisplayCell:(NSObject *)p1 forTableColumn:(NSTableColumn *)p2 row:(NSInteger)p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_40 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x44C20);
	}

	-(BOOL) respondsToSelector:(SEL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x44D20);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation __NSGestureRecognizerToken {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x53A20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation __NSGestureRecognizerParameterlessToken {
}

	-(void) target
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x53B20);
	}
@end

@implementation __NSGestureRecognizerParametrizedToken {
}

	-(void) target:(NSGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x53C20);
	}
@end

@interface AppKit_NSGestureRecognizer__NSGestureRecognizerDelegate : NSObject<NSGestureRecognizerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldAttemptToRecognizeWithEvent:(NSEvent *)p1;
	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldBeRequiredToFailByGestureRecognizer:(NSGestureRecognizer *)p1;
	-(BOOL) gestureRecognizerShouldBegin:(NSGestureRecognizer *)p0;
	-(BOOL) xamarinselector:(NSGestureRecognizer *)p0 removed:(NSEvent *)p1;
	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldReceiveTouch:(NSTouch *)p1;
	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldRecognizeSimultaneouslyWithGestureRecognizer:(NSGestureRecognizer *)p1;
	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldRequireFailureOfGestureRecognizer:(NSGestureRecognizer *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation AppKit_NSGestureRecognizer__NSGestureRecognizerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldAttemptToRecognizeWithEvent:(NSEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x53E20);
	}

	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldBeRequiredToFailByGestureRecognizer:(NSGestureRecognizer *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x53F20);
	}

	-(BOOL) gestureRecognizerShouldBegin:(NSGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x54020);
	}

	-(BOOL) xamarinselector:(NSGestureRecognizer *)p0 removed:(NSEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x54120);
	}

	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldReceiveTouch:(NSTouch *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x54220);
	}

	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldRecognizeSimultaneouslyWithGestureRecognizer:(NSGestureRecognizer *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x54320);
	}

	-(BOOL) gestureRecognizer:(NSGestureRecognizer *)p0 shouldRequireFailureOfGestureRecognizer:(NSGestureRecognizer *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x54420);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x53D20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __NSClickGestureRecognizer : __NSGestureRecognizerToken {
}
	-(void) target:(NSClickGestureRecognizer *)p0;
@end

@implementation __NSClickGestureRecognizer {
}

	-(void) target:(NSClickGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x54F20);
	}
@end

@interface __NSMagnificationGestureRecognizer : __NSGestureRecognizerToken {
}
	-(void) target:(NSMagnificationGestureRecognizer *)p0;
@end

@implementation __NSMagnificationGestureRecognizer {
}

	-(void) target:(NSMagnificationGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x55620);
	}
@end

@interface __NSPanGestureRecognizer : __NSGestureRecognizerToken {
}
	-(void) target:(NSPanGestureRecognizer *)p0;
@end

@implementation __NSPanGestureRecognizer {
}

	-(void) target:(NSPanGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x55D20);
	}
@end

@interface __NSPressGestureRecognizer : __NSGestureRecognizerToken {
}
	-(void) target:(NSPressGestureRecognizer *)p0;
@end

@implementation __NSPressGestureRecognizer {
}

	-(void) target:(NSPressGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x56120);
	}
@end

@interface __NSRotationGestureRecognizer : __NSGestureRecognizerToken {
}
	-(void) target:(NSRotationGestureRecognizer *)p0;
@end

@implementation __NSRotationGestureRecognizer {
}

	-(void) target:(NSRotationGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x56520);
	}
@end

@interface AppKit_NSTextField__NSTextFieldDelegate : NSObject<NSTextFieldDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) controlTextDidChange:(NSNotification *)p0;
	-(BOOL) control:(NSControl *)p0 didFailToFormatString:(NSString *)p1 errorDescription:(NSString *)p2;
	-(void) control:(NSControl *)p0 didFailToValidatePartialString:(NSString *)p1 errorDescription:(NSString *)p2;
	-(BOOL) control:(NSControl *)p0 textView:(NSTextView *)p1 doCommandBySelector:(SEL)p2;
	-(void) controlTextDidBeginEditing:(NSNotification *)p0;
	-(void) controlTextDidEndEditing:(NSNotification *)p0;
	-(NSArray *) textField:(NSTextField *)p0 textView:(NSTextView *)p1 candidatesForSelectedRange:(NSRange)p2;
	-(NSArray *) control:(NSControl *)p0 textView:(NSTextView *)p1 completions:(NSArray *)p2 forPartialWordRange:(NSRange)p3 indexOfSelectedItem:(NSInteger*)p4;
	-(NSArray *) textField:(NSTextField *)p0 textView:(NSTextView *)p1 candidates:(NSArray *)p2 forSelectedRange:(NSRange)p3;
	-(BOOL) control:(NSControl *)p0 isValidObject:(NSObject *)p1;
	-(BOOL) textField:(NSTextField *)p0 textView:(NSTextView *)p1 shouldSelectCandidateAtIndex:(NSUInteger)p2;
	-(BOOL) control:(NSControl *)p0 textShouldBeginEditing:(NSText *)p1;
	-(BOOL) control:(NSControl *)p0 textShouldEndEditing:(NSText *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation AppKit_NSTextField__NSTextFieldDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) controlTextDidChange:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x60D20);
	}

	-(BOOL) control:(NSControl *)p0 didFailToFormatString:(NSString *)p1 errorDescription:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, p1, p2, 0x60E20);
	}

	-(void) control:(NSControl *)p0 didFailToValidatePartialString:(NSString *)p1 errorDescription:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_42 (self, _cmd, &managed_method, p0, p1, p2, 0x60F20);
	}

	-(BOOL) control:(NSControl *)p0 textView:(NSTextView *)p1 doCommandBySelector:(SEL)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_43 (self, _cmd, &managed_method, p0, p1, p2, 0x61020);
	}

	-(void) controlTextDidBeginEditing:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x61120);
	}

	-(void) controlTextDidEndEditing:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x61220);
	}

	-(NSArray *) textField:(NSTextField *)p0 textView:(NSTextView *)p1 candidatesForSelectedRange:(NSRange)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_44 (self, _cmd, &managed_method, p0, p1, p2, 0x61320);
	}

	-(NSArray *) control:(NSControl *)p0 textView:(NSTextView *)p1 completions:(NSArray *)p2 forPartialWordRange:(NSRange)p3 indexOfSelectedItem:(NSInteger*)p4
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x61420);
	}

	-(NSArray *) textField:(NSTextField *)p0 textView:(NSTextView *)p1 candidates:(NSArray *)p2 forSelectedRange:(NSRange)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_46 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x61520);
	}

	-(BOOL) control:(NSControl *)p0 isValidObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x61620);
	}

	-(BOOL) textField:(NSTextField *)p0 textView:(NSTextView *)p1 shouldSelectCandidateAtIndex:(NSUInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_47 (self, _cmd, &managed_method, p0, p1, p2, 0x61720);
	}

	-(BOOL) control:(NSControl *)p0 textShouldBeginEditing:(NSText *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x61820);
	}

	-(BOOL) control:(NSControl *)p0 textShouldEndEditing:(NSText *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x61920);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x60C20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface AppKit_NSWindow__NSWindowDelegate : NSObject<NSWindowDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSArray *) customWindowsToEnterFullScreenForWindow:(NSWindow *)p0;
	-(NSArray *) customWindowsToExitFullScreenForWindow:(NSWindow *)p0;
	-(void) windowDidBecomeKey:(NSNotification *)p0;
	-(void) windowDidBecomeMain:(NSNotification *)p0;
	-(void) windowDidChangeBackingProperties:(NSNotification *)p0;
	-(void) windowDidChangeScreen:(NSNotification *)p0;
	-(void) windowDidChangeScreenProfile:(NSNotification *)p0;
	-(void) window:(NSWindow *)p0 didDecodeRestorableState:(NSCoder *)p1;
	-(void) windowDidDeminiaturize:(NSNotification *)p0;
	-(void) windowDidEndLiveResize:(NSNotification *)p0;
	-(void) windowDidEndSheet:(NSNotification *)p0;
	-(void) windowDidEnterFullScreen:(NSNotification *)p0;
	-(void) windowDidEnterVersionBrowser:(NSNotification *)p0;
	-(void) windowDidExitFullScreen:(NSNotification *)p0;
	-(void) windowDidExitVersionBrowser:(NSNotification *)p0;
	-(void) windowDidExpose:(NSNotification *)p0;
	-(void) windowDidFailToEnterFullScreen:(NSWindow *)p0;
	-(void) windowDidFailToExitFullScreen:(NSWindow *)p0;
	-(void) windowDidMiniaturize:(NSNotification *)p0;
	-(void) windowDidMove:(NSNotification *)p0;
	-(void) windowDidResignKey:(NSNotification *)p0;
	-(void) windowDidResignMain:(NSNotification *)p0;
	-(void) windowDidResize:(NSNotification *)p0;
	-(void) windowDidUpdate:(NSNotification *)p0;
	-(BOOL) window:(NSWindow *)p0 shouldDragDocumentWithEvent:(NSEvent *)p1 from:(CGPoint)p2 withPasteboard:(NSPasteboard *)p3;
	-(BOOL) window:(NSWindow *)p0 shouldPopUpDocumentPathMenu:(NSMenu *)p1;
	-(BOOL) windowShouldZoom:(NSWindow *)p0 toFrame:(CGRect)p1;
	-(void) window:(NSWindow *)p0 startCustomAnimationToEnterFullScreenWithDuration:(double)p1;
	-(void) window:(NSWindow *)p0 startCustomAnimationToExitFullScreenWithDuration:(double)p1;
	-(void) windowWillBeginSheet:(NSNotification *)p0;
	-(void) windowWillClose:(NSNotification *)p0;
	-(void) window:(NSWindow *)p0 willEncodeRestorableState:(NSCoder *)p1;
	-(void) windowWillEnterFullScreen:(NSNotification *)p0;
	-(void) windowWillEnterVersionBrowser:(NSNotification *)p0;
	-(void) windowWillExitFullScreen:(NSNotification *)p0;
	-(void) windowWillExitVersionBrowser:(NSNotification *)p0;
	-(void) windowWillMiniaturize:(NSNotification *)p0;
	-(void) windowWillMove:(NSNotification *)p0;
	-(CGRect) window:(NSWindow *)p0 willPositionSheet:(NSWindow *)p1 usingRect:(CGRect)p2;
	-(CGSize) windowWillResize:(NSWindow *)p0 toSize:(CGSize)p1;
	-(CGSize) window:(NSWindow *)p0 willResizeForVersionBrowserWithMaxPreferredSize:(CGSize)p1 maxAllowedSize:(CGSize)p2;
	-(NSObject *) windowWillReturnFieldEditor:(NSWindow *)p0 toObject:(NSObject *)p1;
	-(NSUndoManager *) windowWillReturnUndoManager:(NSWindow *)p0;
	-(void) windowWillStartLiveResize:(NSNotification *)p0;
	-(CGSize) window:(NSWindow *)p0 willUseFullScreenContentSize:(CGSize)p1;
	-(NSUInteger) window:(NSWindow *)p0 willUseFullScreenPresentationOptions:(NSUInteger)p1;
	-(CGRect) windowWillUseStandardFrame:(NSWindow *)p0 defaultFrame:(CGRect)p1;
	-(BOOL) windowShouldClose:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation AppKit_NSWindow__NSWindowDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSArray *) customWindowsToEnterFullScreenForWindow:(NSWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_48 (self, _cmd, &managed_method, p0, 0x69920);
	}

	-(NSArray *) customWindowsToExitFullScreenForWindow:(NSWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_48 (self, _cmd, &managed_method, p0, 0x69A20);
	}

	-(void) windowDidBecomeKey:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x69B20);
	}

	-(void) windowDidBecomeMain:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x69C20);
	}

	-(void) windowDidChangeBackingProperties:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x69D20);
	}

	-(void) windowDidChangeScreen:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x69E20);
	}

	-(void) windowDidChangeScreenProfile:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x69F20);
	}

	-(void) window:(NSWindow *)p0 didDecodeRestorableState:(NSCoder *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x6A020);
	}

	-(void) windowDidDeminiaturize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A120);
	}

	-(void) windowDidEndLiveResize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A220);
	}

	-(void) windowDidEndSheet:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A320);
	}

	-(void) windowDidEnterFullScreen:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A420);
	}

	-(void) windowDidEnterVersionBrowser:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A520);
	}

	-(void) windowDidExitFullScreen:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A620);
	}

	-(void) windowDidExitVersionBrowser:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A720);
	}

	-(void) windowDidExpose:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A820);
	}

	-(void) windowDidFailToEnterFullScreen:(NSWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6A920);
	}

	-(void) windowDidFailToExitFullScreen:(NSWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AA20);
	}

	-(void) windowDidMiniaturize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AB20);
	}

	-(void) windowDidMove:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AC20);
	}

	-(void) windowDidResignKey:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AD20);
	}

	-(void) windowDidResignMain:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AE20);
	}

	-(void) windowDidResize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6AF20);
	}

	-(void) windowDidUpdate:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6B020);
	}

	-(BOOL) window:(NSWindow *)p0 shouldDragDocumentWithEvent:(NSEvent *)p1 from:(CGPoint)p2 withPasteboard:(NSPasteboard *)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_49 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x6B120);
	}

	-(BOOL) window:(NSWindow *)p0 shouldPopUpDocumentPathMenu:(NSMenu *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x6B220);
	}

	-(BOOL) windowShouldZoom:(NSWindow *)p0 toFrame:(CGRect)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, p0, p1, 0x6B320);
	}

	-(void) window:(NSWindow *)p0 startCustomAnimationToEnterFullScreenWithDuration:(double)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_51 (self, _cmd, &managed_method, p0, p1, 0x6B420);
	}

	-(void) window:(NSWindow *)p0 startCustomAnimationToExitFullScreenWithDuration:(double)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_51 (self, _cmd, &managed_method, p0, p1, 0x6B520);
	}

	-(void) windowWillBeginSheet:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6B620);
	}

	-(void) windowWillClose:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6B720);
	}

	-(void) window:(NSWindow *)p0 willEncodeRestorableState:(NSCoder *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x6B820);
	}

	-(void) windowWillEnterFullScreen:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6B920);
	}

	-(void) windowWillEnterVersionBrowser:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6BA20);
	}

	-(void) windowWillExitFullScreen:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6BB20);
	}

	-(void) windowWillExitVersionBrowser:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6BC20);
	}

	-(void) windowWillMiniaturize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6BD20);
	}

	-(void) windowWillMove:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6BE20);
	}

	-(CGRect) window:(NSWindow *)p0 willPositionSheet:(NSWindow *)p1 usingRect:(CGRect)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_52 (self, _cmd, &managed_method, p0, p1, p2, 0x6BF20);
	}

	-(CGSize) windowWillResize:(NSWindow *)p0 toSize:(CGSize)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, p1, 0x6C020);
	}

	-(CGSize) window:(NSWindow *)p0 willResizeForVersionBrowserWithMaxPreferredSize:(CGSize)p1 maxAllowedSize:(CGSize)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_54 (self, _cmd, &managed_method, p0, p1, p2, 0x6C120);
	}

	-(NSObject *) windowWillReturnFieldEditor:(NSWindow *)p0 toObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x6C220);
	}

	-(NSUndoManager *) windowWillReturnUndoManager:(NSWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x6C320);
	}

	-(void) windowWillStartLiveResize:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x6C420);
	}

	-(CGSize) window:(NSWindow *)p0 willUseFullScreenContentSize:(CGSize)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, p1, 0x6C520);
	}

	-(NSUInteger) window:(NSWindow *)p0 willUseFullScreenPresentationOptions:(NSUInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_55 (self, _cmd, &managed_method, p0, p1, 0x6C620);
	}

	-(CGRect) windowWillUseStandardFrame:(NSWindow *)p0 defaultFrame:(CGRect)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_56 (self, _cmd, &managed_method, p0, p1, 0x6C720);
	}

	-(BOOL) windowShouldClose:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x6C820);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x69820);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface AppKit_NSDatePicker__NSDatePickerCellDelegate : NSObject<NSDatePickerCellDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) datePickerCell:(NSDatePickerCell *)p0 validateProposedDateValue:(NSDate **)p1 timeInterval:(double)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation AppKit_NSDatePicker__NSDatePickerCellDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) datePickerCell:(NSDatePickerCell *)p0 validateProposedDateValue:(NSDate **)p1 timeInterval:(double)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_57 (self, _cmd, &managed_method, p0, p1, p2, 0x74220);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x74120);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface AppKit_NSPageController__NSPageControllerDelegate : NSObject<NSPageControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) pageControllerDidEndLiveTransition:(NSPageController *)p0;
	-(void) pageController:(NSPageController *)p0 didTransitionToObject:(NSObject *)p1;
	-(CGRect) pageController:(NSPageController *)p0 frameForObject:(NSObject *)p1;
	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1;
	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1;
	-(void) pageController:(NSPageController *)p0 prepareViewController:(NSViewController *)p1 withObject:(NSObject *)p2;
	-(void) pageControllerWillStartLiveTransition:(NSPageController *)p0;
	-(BOOL) respondsToSelector:(SEL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation AppKit_NSPageController__NSPageControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) pageControllerDidEndLiveTransition:(NSPageController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x80020);
	}

	-(void) pageController:(NSPageController *)p0 didTransitionToObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x80120);
	}

	-(CGRect) pageController:(NSPageController *)p0 frameForObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_58 (self, _cmd, &managed_method, p0, p1, 0x80220);
	}

	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_59 (self, _cmd, &managed_method, p0, p1, 0x80320);
	}

	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x80420);
	}

	-(void) pageController:(NSPageController *)p0 prepareViewController:(NSViewController *)p1 withObject:(NSObject *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x80520);
	}

	-(void) pageControllerWillStartLiveTransition:(NSPageController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x80620);
	}

	-(BOOL) respondsToSelector:(SEL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x80720);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface AppKit_NSSearchField__NSSearchFieldDelegate : AppKit_NSTextField__NSTextFieldDelegate<NSSearchFieldDelegate, NSTextFieldDelegate> {
}
	-(void) searchFieldDidEndSearching:(NSSearchField *)p0;
	-(void) searchFieldDidStartSearching:(NSSearchField *)p0;
	-(id) init;
@end

@implementation AppKit_NSSearchField__NSSearchFieldDelegate {
}

	-(void) searchFieldDidEndSearching:(NSSearchField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x85B20);
	}

	-(void) searchFieldDidStartSearching:(NSSearchField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x85C20);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x85A20);
		if (call_super && rv) {
			struct objc_super super = {  rv, [AppKit_NSTextField__NSTextFieldDelegate class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface AppKit_NSToolbar__NSToolbarDelegate : NSObject<NSToolbarDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSArray *) toolbarAllowedItemIdentifiers:(NSToolbar *)p0;
	-(NSArray *) toolbarDefaultItemIdentifiers:(NSToolbar *)p0;
	-(void) toolbarDidRemoveItem:(NSNotification *)p0;
	-(BOOL) toolbar:(NSToolbar *)p0 itemIdentifier:(NSString *)p1 canBeInsertedAtIndex:(NSInteger)p2;
	-(NSSet <NSString *>*) toolbarImmovableItemIdentifiers:(NSToolbar *)p0;
	-(NSArray *) toolbarSelectableItemIdentifiers:(NSToolbar *)p0;
	-(void) toolbarWillAddItem:(NSNotification *)p0;
	-(NSToolbarItem *) toolbar:(NSToolbar *)p0 itemForItemIdentifier:(NSString *)p1 willBeInsertedIntoToolbar:(BOOL)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation AppKit_NSToolbar__NSToolbarDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSArray *) toolbarAllowedItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, 0x91620);
	}

	-(NSArray *) toolbarDefaultItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, 0x91720);
	}

	-(void) toolbarDidRemoveItem:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x91820);
	}

	-(BOOL) toolbar:(NSToolbar *)p0 itemIdentifier:(NSString *)p1 canBeInsertedAtIndex:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_62 (self, _cmd, &managed_method, p0, p1, p2, 0x91920);
	}

	-(NSSet <NSString *>*) toolbarImmovableItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x91A20);
	}

	-(NSArray *) toolbarSelectableItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, 0x91B20);
	}

	-(void) toolbarWillAddItem:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x91C20);
	}

	-(NSToolbarItem *) toolbar:(NSToolbar *)p0 itemForItemIdentifier:(NSString *)p1 willBeInsertedIntoToolbar:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_63 (self, _cmd, &managed_method, p0, p1, p2, 0x91D20);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface __NSObject_Disposer : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	+(void) drain:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation __NSObject_Disposer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	+(void) drain:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_64 (self, _cmd, &managed_method, p0, 0xF9420);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF9120);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_macOS_Controls_FormsBoxView : NSView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) drawRect:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_macOS_Controls_FormsBoxView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) drawRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_65 (self, _cmd, &managed_method, p0, 0x3230);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3630);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_macOS_Controls_FormsNSSlider : NSSlider {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_macOS_Controls_FormsNSSlider {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_66 (self, _cmd, &managed_method, p0, 0x3830);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSSlider class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FormsNSDatePicker : NSDatePicker {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) resignFirstResponder;
	-(BOOL) becomeFirstResponder;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsNSDatePicker {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) resignFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x4A30);
	}

	-(BOOL) becomeFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x4B30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4C30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSDatePicker class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsApplicationDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) applicationDidFinishLaunching:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x5530);
	}

	-(void) applicationDidBecomeActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x5630);
	}

	-(void) applicationDidResignActive:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x5730);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6030);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_PlatformRenderer : NSViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) viewDidAppear;
	-(void) viewDidLayout;
	-(void) viewWillAppear;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_PlatformRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewDidAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x6530);
	}

	-(void) viewDidLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x6630);
	}

	-(void) viewWillAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x6730);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FlippedClipView : NSClipView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) isFlipped;
	-(CGRect) constrainBoundsRect:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_FlippedClipView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) isFlipped
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x9330);
	}

	-(CGRect) constrainBoundsRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_67 (self, _cmd, &managed_method, p0, 0x9630);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSClipView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewWillAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xAA30);
	}

	-(CGRect) splitView:(NSSplitView *)p0 effectiveRect:(CGRect)p1 forDrawnRect:(CGRect)p2 ofDividerAtIndex:(NSInteger)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_68 (self, _cmd, &managed_method, p0, p1, p2, p3, 0xAB30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xB430);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSSplitViewController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_MasterDetailPageRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9930);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsNSView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) updateLayer
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xB630);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PageRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewDidAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC530);
	}

	-(void) viewDidDisappear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC630);
	}

	-(void) viewWillAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC730);
	}

	-(void) viewDidLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC830);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBA30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSViewController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1 {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) keyDown:(NSEvent *)p0
	{
		MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_69 (self, _cmd, &managed_method, p0, 0x44430);
	}

	-(void) mouseDown:(NSEvent *)p0
	{
		MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_69 (self, _cmd, &managed_method, p0, 0x44630);
	}

	-(void) rightMouseUp:(NSEvent *)p0
	{
		MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_69 (self, _cmd, &managed_method, p0, 0x44730);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
	-(id) init
	{
		xamarin_throw_product_exception (4126, "Cannot construct an instance of the type 'Xamarin.Forms.Platform.MacOS.VisualElementRenderer`1' from Objective-C because the type is generic.");

		return self;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_DefaultRenderer : Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1 {
}
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_DefaultRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xD330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ViewRenderer_2 {
}

	-(void) layout
	{
		MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_70 (self, _cmd, &managed_method, 0x3ED30);
	}
	-(id) init
	{
		xamarin_throw_product_exception (4126, "Cannot construct an instance of the type 'Xamarin.Forms.Platform.MacOS.ViewRenderer`2' from Objective-C because the type is generic.");

		return self;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_BoxViewRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xEF30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ScrollViewRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x10F30);
	}

	-(void) UpdateScrollPosition
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x11E30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x10430);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSScrollView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ActivityIndicatorRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x12430);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_DatePickerRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x13130);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_FrameRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x16230);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FormsNSImageView : NSImageView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) isOpaque;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsNSImageView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) isOpaque
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x16430);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x16530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSImageView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_OpenGLViewRenderer : Xamarin_Forms_Platform_MacOS_ViewRenderer_2 {
}
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_OpenGLViewRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x17630);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_MacOSOpenGLView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x17730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PickerRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x18530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ProgressBarRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x18B30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_SearchBarRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x19D30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FormsSliderCell : NSSliderCell {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) drawBarInside:(CGRect)p0 flipped:(BOOL)p1;
	-(void) drawKnob:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) copyWithZone: (NSZone *)zone;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsSliderCell {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) drawBarInside:(CGRect)p0 flipped:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_71 (self, _cmd, &managed_method, p0, p1, 0x1A430);
	}

	-(void) drawKnob:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_65 (self, _cmd, &managed_method, p0, 0x1A530);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
	-(id) copyWithZone: (NSZone *) zone
	{
		id rv;
		GCHandle gchandle;
		enum XamarinGCHandleFlags flags = XamarinGCHandleFlags_None;

		gchandle = xamarin_get_gchandle_with_flags (self, &flags);
		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, INVALID_GCHANDLE, XamarinGCHandleFlags_None);
		rv = [super copyWithZone: zone];

		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, gchandle, flags);

		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1A630);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSSliderCell class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_SliderRenderer {
}

	-(void) ValueChanged
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x1AE30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1B230);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_StepperRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1BC30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_CheckBoxRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1C330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_SwitchRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1CA30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_TimePickerRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1D530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_CellNSView : NSView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) layout;
	-(void) updateLayer;
	-(void) rightMouseDown:(NSEvent *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_CellNSView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x20B30);
	}

	-(void) updateLayer
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x20C30);
	}

	-(void) rightMouseDown:(NSEvent *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x21130);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_ViewCellNSView : Xamarin_Forms_Platform_MacOS_CellNSView {
}
	-(void) layout;
	-(void) updateLayer;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_ViewCellNSView {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x24030);
	}

	-(void) updateLayer
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x24130);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23C30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_CellNSView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_ListViewDataSource : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) tableView:(NSTableView *)p0 isGroupRow:(NSInteger)p1;
	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1;
	-(CGFloat) tableView:(NSTableView *)p0 heightOfRow:(NSInteger)p1;
	-(NSInteger) numberOfRowsInTableView:(NSTableView *)p0;
	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_ListViewDataSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) tableView:(NSTableView *)p0 isGroupRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, 0x25030);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, 0x25130);
	}

	-(CGFloat) tableView:(NSTableView *)p0 heightOfRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, p1, 0x25230);
	}

	-(NSInteger) numberOfRowsInTableView:(NSTableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_72 (self, _cmd, &managed_method, p0, 0x25330);
	}

	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, p2, 0x25430);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_CustomNSTableHeaderView : NSTableHeaderView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSAttributedString *) pageHeader;
	-(void) drawRect:(CGRect)p0;
	-(void) layout;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_CustomNSTableHeaderView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSAttributedString *) pageHeader
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_73 (self, _cmd, &managed_method, 0x25F30);
	}

	-(void) drawRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_65 (self, _cmd, &managed_method, p0, 0x26030);
	}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x26130);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x25C30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSTableHeaderView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FormsPageControllerDelegate : NSObject<NSPageControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1;
	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_FormsPageControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x2DC30);
	}

	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_59 (self, _cmd, &managed_method, p0, p1, 0x2DD30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_NavigationChildPageWrapper : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_NavigationChildPageWrapper {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_NativeViewPropertyListener : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) observeValueForKeyPath:(NSString *)p0 ofObject:(NSObject *)p1 change:(NSDictionary *)p2 context:(void *)p3;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_NativeViewPropertyListener {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) observeValueForKeyPath:(NSString *)p0 ofObject:(NSObject *)p1 change:(NSDictionary *)p2 context:(void *)p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x2EA30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_LayoutRenderer : Xamarin_Forms_Platform_MacOS_DefaultRenderer {
}
	-(void) layout;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_LayoutRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x2EB30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2EC30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_DefaultRenderer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_NSPageContainer : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_NSPageContainer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_PageControllerDelegate : NSObject<NSPageControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1;
	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1;
	-(void) pageController:(NSPageController *)p0 prepareViewController:(NSViewController *)p1 withObject:(NSObject *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_PageControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSString *) pageController:(NSPageController *)p0 identifierForObject:(NSObject *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_59 (self, _cmd, &managed_method, p0, p1, 0x2F230);
	}

	-(NSViewController *) pageController:(NSPageController *)p0 viewControllerForIdentifier:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x2F330);
	}

	-(void) pageController:(NSPageController *)p0 prepareViewController:(NSViewController *)p1 withObject:(NSObject *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x2F430);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2F530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_TableViewRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x32030);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_TableViewDataSource : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) tableViewSelectionDidChange:(NSNotification *)p0;
	-(NSInteger) numberOfRowsInTableView:(NSTableView *)p0;
	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1;
	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_TableViewDataSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) tableViewSelectionDidChange:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x32530);
	}

	-(NSInteger) numberOfRowsInTableView:(NSTableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_72 (self, _cmd, &managed_method, p0, 0x32630);
	}

	-(BOOL) tableView:(NSTableView *)p0 shouldSelectRow:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, 0x32730);
	}

	-(NSView *) tableView:(NSTableView *)p0 viewForTableColumn:(NSTableColumn *)p1 row:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, p2, 0x32830);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_UnEvenTableViewModelRenderer : Xamarin_Forms_Platform_MacOS_TableViewDataSource {
}
@end

@implementation Xamarin_Forms_Platform_MacOS_UnEvenTableViewModelRenderer {
}
@end

@interface Xamarin_Forms_Platform_MacOS_VerticallyCenteredTextFieldCell : NSTextFieldCell {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGRect) drawingRectForBounds:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) copyWithZone: (NSZone *)zone;
@end

@implementation Xamarin_Forms_Platform_MacOS_VerticallyCenteredTextFieldCell {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGRect) drawingRectForBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_67 (self, _cmd, &managed_method, p0, 0x35630);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
	-(id) copyWithZone: (NSZone *) zone
	{
		id rv;
		GCHandle gchandle;
		enum XamarinGCHandleFlags flags = XamarinGCHandleFlags_None;

		gchandle = xamarin_get_gchandle_with_flags (self, &flags);
		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, INVALID_GCHANDLE, XamarinGCHandleFlags_None);
		rv = [super copyWithZone: zone];

		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, gchandle, flags);

		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_NativeViewWrapperRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x39C30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39A30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_LabelRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x3AA30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3A830);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ViewRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3D930);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 {
}
	-(id) init
	{
		xamarin_throw_product_exception (4126, "Cannot construct an instance of the type 'Xamarin.Forms.Platform.MacOS.ShapeRenderer`2' from Objective-C because the type is generic.");

		return self;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PathRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x48730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ShapeView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) isFlipped
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x4D830);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4D530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PathView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49130);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_EllipseRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_EllipseView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49530);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_LineRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_LineView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4A330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PolygonRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4A430);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PolygonView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4AD30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PolylineRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4AE30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_PolylineView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4B730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_RectangleRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4B830);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_RectangleView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4BF30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ShapeView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ShapeLayer {
	XamarinObject __monoObjectGCHandle;
}
	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) drawInContext:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_75 (self, _cmd, &managed_method, p0, 0x4DA30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4D930);
		if (call_super && rv) {
			struct objc_super super = {  rv, [CALayer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer_ViewControllerWrapper : NSViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) viewWillLayout;
	-(void) viewWillAppear;
	-(void) viewWillDisappear;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer_ViewControllerWrapper {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewWillLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x52A30);
	}

	-(void) viewWillAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x52B30);
	}

	-(void) viewWillDisappear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x52C30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ButtonRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xE330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_RadioButtonRenderer_FormsNSButton : NSButton {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) mouseDown:(NSEvent *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_RadioButtonRenderer_FormsNSButton {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) mouseDown:(NSEvent *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x53E30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x53F30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_RadioButtonRenderer {
}

	-(void) observeValueForKeyPath:(NSString *)p0 ofObject:(NSObject *)p1 change:(NSDictionary *)p2 context:(void *)p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, p1, p2, p3, 0xFF30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x10230);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_EntryRenderer_FormsNSTextField : NSTextField {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) resignFirstResponder;
	-(BOOL) becomeFirstResponder;
	-(void) textDidEndEditing:(NSNotification *)p0;
	-(void) keyUp:(NSEvent *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_EntryRenderer_FormsNSTextField {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) resignFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x54030);
	}

	-(BOOL) becomeFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, 0x54130);
	}

	-(void) textDidEndEditing:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x54230);
	}

	-(void) keyUp:(NSEvent *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x54330);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x54730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSTextField class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_EntryRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x13430);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x14B30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_EditorRenderer {
}

	-(void) layout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x14D30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x15C30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ImageRenderer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x16630);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_WebViewRenderer_FormsWebFrameDelegate : NSObject<WebFrameLoadDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) webView:(WebView *)p0 didFinishLoadForFrame:(WebFrame *)p1;
	-(void) webView:(WebView *)p0 didFailLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_WebViewRenderer_FormsWebFrameDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) webView:(WebView *)p0 didFinishLoadForFrame:(WebFrame *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, 0x55630);
	}

	-(void) webView:(WebView *)p0 didFailLoadWithError:(NSError *)p1 forFrame:(WebFrame *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, p2, 0x55730);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_WebViewRenderer {
}

	-(void) webView:(WebView *)p0 decidePolicyForNavigationAction:(NSDictionary *)p1 request:(NSURLRequest *)p2 frame:(WebFrame *)p3 decisionListener:(id)p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_76 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x1D830);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1E330);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_ListViewRenderer_FormsNSTableView : NSTableView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) mouseDown:(NSEvent *)p0;
	-(BOOL) validateProposedFirstResponder:(NSResponder *)p0 forEvent:(NSEvent *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_ListViewRenderer_FormsNSTableView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) mouseDown:(NSEvent *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x55C30);
	}

	-(BOOL) validateProposedFirstResponder:(NSResponder *)p0 forEvent:(NSEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, 0x55D30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x55E30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSTableView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_ListViewRenderer {
}

	-(void) viewWillDraw
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x1E630);
	}

	-(void) viewDidChangeEffectiveAppearance
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x1EB30);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1FD30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation CarouselPageRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSInteger) selectedIndex
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_77 (self, _cmd, &managed_method, 0x26530);
	}

	-(void) setSelectedIndex:(NSInteger)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_78 (self, _cmd, &managed_method, p0, 0x26630);
	}

	-(void) viewDidAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x27030);
	}

	-(void) viewDidDisappear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x27130);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x26230);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSPageController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_TabbedPageRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewWillLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x28D30);
	}

	-(NSInteger) selectedTabViewItemIndex
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_77 (self, _cmd, &managed_method, 0x28E30);
	}

	-(void) setSelectedTabViewItemIndex:(NSInteger)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_78 (self, _cmd, &managed_method, p0, 0x28F30);
	}

	-(void) viewDidAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x29030);
	}

	-(void) viewDidDisappear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x29130);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2A730);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSTabViewController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Xamarin_Forms_Platform_MacOS_NavigationPageRenderer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewDidDisappear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x2BC30);
	}

	-(void) viewDidAppear
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x2BD30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2AD30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSViewController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_NativeToolbarTracker_ToolBarItemNSButton : NSView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Xamarin_Forms_Platform_MacOS_NativeToolbarTracker_ToolBarItemNSButton {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_NativeToolbarTracker : NSObject<NSToolbarDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSArray *) toolbarAllowedItemIdentifiers:(NSToolbar *)p0;
	-(NSArray *) toolbarDefaultItemIdentifiers:(NSToolbar *)p0;
	-(NSToolbarItem *) toolbar:(NSToolbar *)p0 itemForItemIdentifier:(NSString *)p1 willBeInsertedIntoToolbar:(BOOL)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_NativeToolbarTracker {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSArray *) toolbarAllowedItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, 0x33630);
	}

	-(NSArray *) toolbarDefaultItemIdentifiers:(NSToolbar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, 0x33730);
	}

	-(NSToolbarItem *) toolbar:(NSToolbar *)p0 itemForItemIdentifier:(NSString *)p1 willBeInsertedIntoToolbar:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_63 (self, _cmd, &managed_method, p0, p1, p2, 0x33830);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x33230);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton_FormsNSButtonCell : NSButtonCell {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGRect) drawTitle:(NSAttributedString *)p0 withFrame:(CGRect)p1 inView:(NSView *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) copyWithZone: (NSZone *)zone;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton_FormsNSButtonCell {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGRect) drawTitle:(NSAttributedString *)p0 withFrame:(CGRect)p1 inView:(NSView *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_79 (self, _cmd, &managed_method, p0, p1, p2, 0x5DF30);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
	-(id) copyWithZone: (NSZone *) zone
	{
		id rv;
		GCHandle gchandle;
		enum XamarinGCHandleFlags flags = XamarinGCHandleFlags_None;

		gchandle = xamarin_get_gchandle_with_flags (self, &flags);
		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, INVALID_GCHANDLE, XamarinGCHandleFlags_None);
		rv = [super copyWithZone: zone];

		if (gchandle != INVALID_GCHANDLE)
			xamarin_set_gchandle_with_flags (self, gchandle, flags);

		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5E030);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSButtonCell class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton : NSButton {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) mouseDown:(NSEvent *)p0;
	-(CGSize) intrinsicContentSize;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) mouseDown:(NSEvent *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x53330);
	}

	-(CGSize) intrinsicContentSize
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_80 (self, _cmd, &managed_method, 0x53530);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x52E30);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation AppDelegate {
}

	-(void) applicationDidFinishLaunching:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x3);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Xamarin_Forms_Platform_MacOS_FormsApplicationDelegate class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

	static MTClassMap __xamarin_class_map [] = {
		{ NULL, 0x22D20 /* #0 'NSObject' => 'Foundation.NSObject, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1020 /* #1 'JSContext' => 'JavaScriptCore.JSContext, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1120 /* #2 'INIntent' => 'Intents.INIntent, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1220 /* #3 'WebFrame' => 'WebKit.WebFrame, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1420 /* #4 'WebPolicyDelegate' => 'WebKit.WebPolicyDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A20 /* #5 'WebFrameLoadDelegate' => 'WebKit.WebFrameLoadDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2120 /* #6 'WebScriptObject' => 'WebKit.WebScriptObject, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3820 /* #7 'CIFilter' => 'CoreImage.CIFilter, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3920 /* #8 'CIVector' => 'CoreImage.CIVector, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3A20 /* #9 'CoreImage_CIColorCrossPolynomial' => 'CoreImage.CIColorCrossPolynomial, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x3B20 /* #10 'CoreImage_CIColorPolynomial' => 'CoreImage.CIColorPolynomial, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x6220 /* #11 'CALayer' => 'CoreAnimation.CALayer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6120 /* #12 'CAGradientLayer' => 'CoreAnimation.CAGradientLayer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6320 /* #13 'CALayerDelegate' => 'CoreAnimation.CALayerDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6820 /* #14 'CAShapeLayer' => 'CoreAnimation.CAShapeLayer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6920 /* #15 'CATransaction' => 'CoreAnimation.CATransaction, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6A20 /* #16 'CKShareMetadata' => 'CloudKit.CKShareMetadata, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6B20 /* #17 '__monomac_internal_ActionDispatcher' => 'AppKit.ActionDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0xED20 /* #18 'NSParagraphStyle' => 'AppKit.NSParagraphStyle, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6F20 /* #19 'NSMutableParagraphStyle' => 'AppKit.NSMutableParagraphStyle, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7820 /* #20 'NSCell' => 'AppKit.NSCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7220 /* #21 'NSActionCell' => 'AppKit.NSActionCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7320 /* #22 '__MonoMac_NSAlertDidEndDispatcher' => 'AppKit.NSAlertDidEndDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x7620 /* #23 'NSBezierPath' => 'AppKit.NSBezierPath, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF320 /* #24 'NSResponder' => 'AppKit.NSResponder, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9F20 /* #25 'NSView' => 'AppKit.NSView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7A20 /* #26 'NSControl' => 'AppKit.NSControl, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7720 /* #27 'NSButton' => 'AppKit.NSButton, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7920 /* #28 'NSColor' => 'AppKit.NSColor, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7D20 /* #29 'NSEvent' => 'AppKit.NSEvent, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7E20 /* #30 'NSFont' => 'AppKit.NSFont, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8E20 /* #31 'NSGraphicsContext' => 'AppKit.NSGraphicsContext, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8F20 /* #32 'NSImage' => 'AppKit.NSImage, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9020 /* #33 'NSImageRep' => 'AppKit.NSImageRep, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9120 /* #34 'NSLayoutManager' => 'AppKit.NSLayoutManager, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9220 /* #35 'NSMenuItem' => 'AppKit.NSMenuItem, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9320 /* #36 'NSPasteboard' => 'AppKit.NSPasteboard, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9420 /* #37 'NSPopUpButton' => 'AppKit.NSPopUpButton, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xBE20 /* #38 'NSButtonCell' => 'AppKit.NSButtonCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xE320 /* #39 'NSMenuItemCell' => 'AppKit.NSMenuItemCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9520 /* #40 'NSPopUpButtonCell' => 'AppKit.NSPopUpButtonCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9620 /* #41 'NSScreen' => 'AppKit.NSScreen, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9720 /* #42 'NSSlider' => 'AppKit.NSSlider, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9920 /* #43 'NSTextContainer' => 'AppKit.NSTextContainer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20B20 /* #44 'NSAttributedString' => 'Foundation.NSAttributedString, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22120 /* #45 'NSMutableAttributedString' => 'Foundation.NSMutableAttributedString, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9C20 /* #46 'NSTextStorage' => 'AppKit.NSTextStorage, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9D20 /* #47 'NSToolbarItem' => 'AppKit.NSToolbarItem, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9E20 /* #48 'NSTouch' => 'AppKit.NSTouch, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA420 /* #49 'NSWorkspace' => 'AppKit.NSWorkspace, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA520 /* #50 'NSLayoutConstraint' => 'AppKit.NSLayoutConstraint, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA620 /* #51 'NSAnimationContext' => 'AppKit.NSAnimationContext, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA720 /* #52 'NSAppearance' => 'AppKit.NSAppearance, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xB420 /* #53 'NSApplicationDelegate' => 'AppKit.NSApplicationDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xC220 /* #54 'NSClipView' => 'AppKit.NSClipView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xC320 /* #55 'NSColorSpace' => 'AppKit.NSColorSpace, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xC620 /* #56 'NSCursor' => 'AppKit.NSCursor, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xCA20 /* #57 'NSDatePickerCell' => 'AppKit.NSDatePickerCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xD220 /* #58 'NSFontDescriptor' => 'AppKit.NSFontDescriptor, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xD820 /* #59 'NSGlyphInfo' => 'AppKit.NSGlyphInfo, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xDD20 /* #60 'NSImageView' => 'AppKit.NSImageView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xDE20 /* #61 'NSLayoutAnchor' => 'AppKit.NSLayoutAnchor`1, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xDF20 /* #62 'NSLayoutXAxisAnchor' => 'AppKit.NSLayoutXAxisAnchor, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xE020 /* #63 'NSLayoutYAxisAnchor' => 'AppKit.NSLayoutYAxisAnchor, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xE220 /* #64 'NSMenu' => 'AppKit.NSMenu, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xEA20 /* #65 'NSPageControllerDelegate' => 'AppKit.NSPageControllerDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA220 /* #66 'NSWindow' => 'AppKit.NSWindow, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xEC20 /* #67 'NSPanel' => 'AppKit.NSPanel, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF020 /* #68 'NSPrintPreviewGraphicsContext' => 'AppKit.NSPrintPreviewGraphicsContext, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF120 /* #69 'NSProgressIndicator' => 'AppKit.NSProgressIndicator, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF420 /* #70 'NSScrollView' => 'AppKit.NSScrollView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11720 /* #71 'NSTextFieldCell' => 'AppKit.NSTextFieldCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF720 /* #72 'NSSearchFieldCell' => 'AppKit.NSSearchFieldCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9A20 /* #73 'NSTextField' => 'AppKit.NSTextField, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF820 /* #74 'NSSecureTextField' => 'AppKit.NSSecureTextField, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF920 /* #75 'NSShadow' => 'AppKit.NSShadow, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFA20 /* #76 'NSSliderCell' => 'AppKit.NSSliderCell, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFC20 /* #77 'NSSplitView' => 'AppKit.NSSplitView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12620 /* #78 'NSViewController' => 'AppKit.NSViewController, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFD20 /* #79 'NSSplitViewController' => 'AppKit.NSSplitViewController, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFE20 /* #80 'NSSplitViewItem' => 'AppKit.NSSplitViewItem, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFF20 /* #81 'NSStepper' => 'AppKit.NSStepper, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10120 /* #82 'NSSwitch' => 'AppKit.NSSwitch, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10220 /* #83 'NSTableColumn' => 'AppKit.NSTableColumn, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10320 /* #84 'NSTableHeaderView' => 'AppKit.NSTableHeaderView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10520 /* #85 'NSTableRowView' => 'AppKit.NSTableRowView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10A20 /* #86 'NSTableViewRowAction' => 'AppKit.NSTableViewRowAction, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10C20 /* #87 'NSTableViewSource' => 'AppKit.NSTableViewSource, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10D20 /* #88 'NSTabView' => 'AppKit.NSTabView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10E20 /* #89 'NSTabViewController' => 'AppKit.NSTabViewController, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11020 /* #90 'NSTabViewItem' => 'AppKit.NSTabViewItem, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11220 /* #91 'NSText' => 'AppKit.NSText, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11420 /* #92 'NSTextAlternatives' => 'AppKit.NSTextAlternatives, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11520 /* #93 'NSTextAttachment' => 'AppKit.NSTextAttachment, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11B20 /* #94 'NSTextView' => 'AppKit.NSTextView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12020 /* #95 'NSToolbarDelegate' => 'AppKit.NSToolbarDelegate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12220 /* #96 'NSToolbarItemGroup' => 'AppKit.NSToolbarItemGroup, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1FB20 /* #97 'NSError' => 'Foundation.NSError, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1FC20 /* #98 'NSUserActivity' => 'Foundation.NSUserActivity, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20320 /* #99 'Foundation_NSDispatcher' => 'Foundation.NSDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20420 /* #100 '__MonoMac_NSSynchronizationContextDispatcher' => 'Foundation.NSSynchronizationContextDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20520 /* #101 '__Xamarin_NSTimerActionDispatcher' => 'Foundation.NSTimerActionDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20620 /* #102 'Foundation_NSAsyncDispatcher' => 'Foundation.NSAsyncDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20720 /* #103 '__MonoMac_NSAsyncActionDispatcher' => 'Foundation.NSAsyncActionDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20820 /* #104 '__MonoMac_NSAsyncSynchronizationContextDispatcher' => 'Foundation.NSAsyncSynchronizationContextDispatcher, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x20920 /* #105 'NSArray' => 'Foundation.NSArray, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20D20 /* #106 'NSAutoreleasePool' => 'Foundation.NSAutoreleasePool, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20E20 /* #107 'NSBundle' => 'Foundation.NSBundle, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21020 /* #108 'NSCalendar' => 'Foundation.NSCalendar, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21120 /* #109 'NSCoder' => 'Foundation.NSCoder, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21520 /* #110 'NSDate' => 'Foundation.NSDate, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21C20 /* #111 'NSIndexPath' => 'Foundation.NSIndexPath, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22020 /* #112 'NSItemProvider' => 'Foundation.NSItemProvider, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22720 /* #113 'NSURLRequest' => 'Foundation.NSUrlRequest, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22820 /* #114 'Foundation_InternalNSNotificationHandler' => 'Foundation.InternalNSNotificationHandler, Xamarin.Mac' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x22B20 /* #115 'NSNull' => 'Foundation.NSNull, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24120 /* #116 'NSValue' => 'Foundation.NSValue, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22C20 /* #117 'NSNumber' => 'Foundation.NSNumber, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23520 /* #118 'NSRunLoop' => 'Foundation.NSRunLoop, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23720 /* #119 'NSSet' => 'Foundation.NSSet, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23A20 /* #120 'NSString' => 'Foundation.NSString, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23B20 /* #121 'NSThread' => 'Foundation.NSThread, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23C20 /* #122 'NSTimeZone' => 'Foundation.NSTimeZone, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23D20 /* #123 'NSTimer' => 'Foundation.NSTimer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23E20 /* #124 'NSUndoManager' => 'Foundation.NSUndoManager, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23F20 /* #125 'NSURL' => 'Foundation.NSUrl, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24020 /* #126 'NSUserDefaults' => 'Foundation.NSUserDefaults, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22920 /* #127 'NSNotificationCenter' => 'Foundation.NSNotificationCenter, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24920 /* #128 'NSDistributedNotificationCenter' => 'Foundation.NSDistributedNotificationCenter, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24B20 /* #129 'NSEnumerator' => 'Foundation.NSEnumerator, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24C20 /* #130 'NSException' => 'Foundation.NSException, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21D20 /* #131 'NSIndexSet' => 'Foundation.NSIndexSet, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24F20 /* #132 'NSMutableIndexSet' => 'Foundation.NSMutableIndexSet, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x25020 /* #133 'NSNotification' => 'Foundation.NSNotification, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x25120 /* #134 'NSProcessInfo' => 'Foundation.NSProcessInfo, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x25420 /* #135 'NSTextCheckingResult' => 'Foundation.NSTextCheckingResult, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1620 /* #136 'WebKit_WebView__WebFrameLoadDelegate' => 'WebKit.WebView+_WebFrameLoadDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1720 /* #137 'WebKit_WebView__WebPolicyDelegate' => 'WebKit.WebView+_WebPolicyDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1520 /* #138 'WebView' => 'WebKit.WebView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6E20 /* #139 'AppKit_NSApplication__NSApplicationDelegate' => 'AppKit.NSApplication+_NSApplicationDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6D20 /* #140 'NSApplication' => 'AppKit.NSApplication, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7120 /* #141 'AppKit_NSTableView__NSTableViewDelegate' => 'AppKit.NSTableView+_NSTableViewDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7020 /* #142 'NSTableView' => 'AppKit.NSTableView, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7420 /* #143 'NSAlert' => 'AppKit.NSAlert, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8020 /* #144 '__NSGestureRecognizerToken' => 'AppKit.NSGestureRecognizer+Token, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8120 /* #145 '__NSGestureRecognizerParameterlessToken' => 'AppKit.NSGestureRecognizer+ParameterlessDispatch, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8220 /* #146 '__NSGestureRecognizerParametrizedToken' => 'AppKit.NSGestureRecognizer+ParametrizedDispatch, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8320 /* #147 'AppKit_NSGestureRecognizer__NSGestureRecognizerDelegate' => 'AppKit.NSGestureRecognizer+_NSGestureRecognizerDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7F20 /* #148 'NSGestureRecognizer' => 'AppKit.NSGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8520 /* #149 '__NSClickGestureRecognizer' => 'AppKit.NSClickGestureRecognizer+Callback, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8420 /* #150 'NSClickGestureRecognizer' => 'AppKit.NSClickGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8720 /* #151 '__NSMagnificationGestureRecognizer' => 'AppKit.NSMagnificationGestureRecognizer+Callback, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8620 /* #152 'NSMagnificationGestureRecognizer' => 'AppKit.NSMagnificationGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8920 /* #153 '__NSPanGestureRecognizer' => 'AppKit.NSPanGestureRecognizer+Callback, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8820 /* #154 'NSPanGestureRecognizer' => 'AppKit.NSPanGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8B20 /* #155 '__NSPressGestureRecognizer' => 'AppKit.NSPressGestureRecognizer+Callback, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8A20 /* #156 'NSPressGestureRecognizer' => 'AppKit.NSPressGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8D20 /* #157 '__NSRotationGestureRecognizer' => 'AppKit.NSRotationGestureRecognizer+Callback, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8C20 /* #158 'NSRotationGestureRecognizer' => 'AppKit.NSRotationGestureRecognizer, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9B20 /* #159 'AppKit_NSTextField__NSTextFieldDelegate' => 'AppKit.NSTextField+_NSTextFieldDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA320 /* #160 'AppKit_NSWindow__NSWindowDelegate' => 'AppKit.NSWindow+_NSWindowDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC820 /* #161 'AppKit_NSDatePicker__NSDatePickerCellDelegate' => 'AppKit.NSDatePicker+_NSDatePickerCellDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC720 /* #162 'NSDatePicker' => 'AppKit.NSDatePicker, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xE520 /* #163 'AppKit_NSPageController__NSPageControllerDelegate' => 'AppKit.NSPageController+_NSPageControllerDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE420 /* #164 'NSPageController' => 'AppKit.NSPageController, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF620 /* #165 'AppKit_NSSearchField__NSSearchFieldDelegate' => 'AppKit.NSSearchField+_NSSearchFieldDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF520 /* #166 'NSSearchField' => 'AppKit.NSSearchField, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11D20 /* #167 'AppKit_NSToolbar__NSToolbarDelegate' => 'AppKit.NSToolbar+_NSToolbarDelegate, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11C20 /* #168 'NSToolbar' => 'AppKit.NSToolbar, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21220 /* #169 'NSData' => 'Foundation.NSData, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21620 /* #170 'NSDictionary' => 'Foundation.NSDictionary, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22220 /* #171 'NSMutableData' => 'Foundation.NSMutableData, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22520 /* #172 'NSMutableDictionary' => 'Foundation.NSMutableDictionary, Xamarin.Mac' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23120 /* #173 '__NSObject_Disposer' => 'Foundation.NSObject+NSObject_Disposer, Xamarin.Mac' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC30 /* #174 'Xamarin_Forms_Platform_macOS_Controls_FormsBoxView' => 'Xamarin.Forms.Platform.macOS.Controls.FormsBoxView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xD30 /* #175 'Xamarin_Forms_Platform_macOS_Controls_FormsNSSlider' => 'Xamarin.Forms.Platform.macOS.Controls.FormsNSSlider, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1230 /* #176 'Xamarin_Forms_Platform_MacOS_FormsNSDatePicker' => 'Xamarin.Forms.Platform.MacOS.FormsNSDatePicker, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1430 /* #177 'Xamarin_Forms_Platform_MacOS_FormsApplicationDelegate' => 'Xamarin.Forms.Platform.MacOS.FormsApplicationDelegate, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1530 /* #178 'Xamarin_Forms_Platform_MacOS_PlatformRenderer' => 'Xamarin.Forms.Platform.MacOS.PlatformRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1C30 /* #179 'Xamarin_Forms_Platform_MacOS_FlippedClipView' => 'Xamarin.Forms.Platform.MacOS.FlippedClipView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1E30 /* #180 'Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer' => 'Xamarin.Forms.Platform.MacOS.FlyoutPageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1D30 /* #181 'Xamarin_Forms_Platform_MacOS_MasterDetailPageRenderer' => 'Xamarin.Forms.Platform.MacOS.MasterDetailPageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F30 /* #182 'Xamarin_Forms_Platform_MacOS_FormsNSView' => 'Xamarin.Forms.Platform.MacOS.FormsNSView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2030 /* #183 'Xamarin_Forms_Platform_MacOS_PageRenderer' => 'Xamarin.Forms.Platform.MacOS.PageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8030 /* #184 'Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1' => 'Xamarin.Forms.Platform.MacOS.VisualElementRenderer`1, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2130 /* #185 'Xamarin_Forms_Platform_MacOS_DefaultRenderer' => 'Xamarin.Forms.Platform.MacOS.DefaultRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7C30 /* #186 'Xamarin_Forms_Platform_MacOS_ViewRenderer_2' => 'Xamarin.Forms.Platform.MacOS.ViewRenderer`2, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2A30 /* #187 'Xamarin_Forms_Platform_MacOS_BoxViewRenderer' => 'Xamarin.Forms.Platform.MacOS.BoxViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2C30 /* #188 'Xamarin_Forms_Platform_MacOS_ScrollViewRenderer' => 'Xamarin.Forms.Platform.MacOS.ScrollViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2D30 /* #189 'Xamarin_Forms_Platform_MacOS_ActivityIndicatorRenderer' => 'Xamarin.Forms.Platform.MacOS.ActivityIndicatorRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2E30 /* #190 'Xamarin_Forms_Platform_MacOS_DatePickerRenderer' => 'Xamarin.Forms.Platform.MacOS.DatePickerRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3130 /* #191 'Xamarin_Forms_Platform_MacOS_FrameRenderer' => 'Xamarin.Forms.Platform.MacOS.FrameRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3230 /* #192 'Xamarin_Forms_Platform_MacOS_FormsNSImageView' => 'Xamarin.Forms.Platform.MacOS.FormsNSImageView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3430 /* #193 'Xamarin_Forms_Platform_MacOS_OpenGLViewRenderer' => 'Xamarin.Forms.Platform.MacOS.OpenGLViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3530 /* #194 'Xamarin_Forms_Platform_MacOS_MacOSOpenGLView' => 'Xamarin.Forms.Platform.MacOS.MacOSOpenGLView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3630 /* #195 'Xamarin_Forms_Platform_MacOS_PickerRenderer' => 'Xamarin.Forms.Platform.MacOS.PickerRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3730 /* #196 'Xamarin_Forms_Platform_MacOS_ProgressBarRenderer' => 'Xamarin.Forms.Platform.MacOS.ProgressBarRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3830 /* #197 'Xamarin_Forms_Platform_MacOS_SearchBarRenderer' => 'Xamarin.Forms.Platform.MacOS.SearchBarRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3930 /* #198 'Xamarin_Forms_Platform_MacOS_FormsSliderCell' => 'Xamarin.Forms.Platform.MacOS.FormsSliderCell, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3A30 /* #199 'Xamarin_Forms_Platform_MacOS_SliderRenderer' => 'Xamarin.Forms.Platform.MacOS.SliderRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3B30 /* #200 'Xamarin_Forms_Platform_MacOS_StepperRenderer' => 'Xamarin.Forms.Platform.MacOS.StepperRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3C30 /* #201 'Xamarin_Forms_Platform_MacOS_CheckBoxRenderer' => 'Xamarin.Forms.Platform.MacOS.CheckBoxRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3D30 /* #202 'Xamarin_Forms_Platform_MacOS_SwitchRenderer' => 'Xamarin.Forms.Platform.MacOS.SwitchRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3E30 /* #203 'Xamarin_Forms_Platform_MacOS_TimePickerRenderer' => 'Xamarin.Forms.Platform.MacOS.TimePickerRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4130 /* #204 'Xamarin_Forms_Platform_MacOS_CellNSView' => 'Xamarin.Forms.Platform.MacOS.CellNSView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4A30 /* #205 'Xamarin_Forms_Platform_MacOS_ViewCellNSView' => 'Xamarin.Forms.Platform.MacOS.ViewCellNSView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4B30 /* #206 'Xamarin_Forms_Platform_MacOS_ListViewDataSource' => 'Xamarin.Forms.Platform.MacOS.ListViewDataSource, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4C30 /* #207 'Xamarin_Forms_Platform_MacOS_CustomNSTableHeaderView' => 'Xamarin.Forms.Platform.MacOS.CustomNSTableHeaderView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5230 /* #208 'Xamarin_Forms_Platform_MacOS_FormsPageControllerDelegate' => 'Xamarin.Forms.Platform.MacOS.FormsPageControllerDelegate, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5330 /* #209 'Xamarin_Forms_Platform_MacOS_NavigationChildPageWrapper' => 'Xamarin.Forms.Platform.MacOS.NavigationChildPageWrapper, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5430 /* #210 'Xamarin_Forms_Platform_MacOS_NativeViewPropertyListener' => 'Xamarin.Forms.Platform.MacOS.NativeViewPropertyListener, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5530 /* #211 'Xamarin_Forms_Platform_MacOS_LayoutRenderer' => 'Xamarin.Forms.Platform.MacOS.LayoutRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5730 /* #212 'Xamarin_Forms_Platform_MacOS_NSPageContainer' => 'Xamarin.Forms.Platform.MacOS.NSPageContainer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5830 /* #213 'Xamarin_Forms_Platform_MacOS_PageControllerDelegate' => 'Xamarin.Forms.Platform.MacOS.PageControllerDelegate, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5C30 /* #214 'Xamarin_Forms_Platform_MacOS_TableViewRenderer' => 'Xamarin.Forms.Platform.MacOS.TableViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5E30 /* #215 'Xamarin_Forms_Platform_MacOS_TableViewDataSource' => 'Xamarin.Forms.Platform.MacOS.TableViewDataSource, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5F30 /* #216 'Xamarin_Forms_Platform_MacOS_UnEvenTableViewModelRenderer' => 'Xamarin.Forms.Platform.MacOS.UnEvenTableViewModelRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6330 /* #217 'Xamarin_Forms_Platform_MacOS_VerticallyCenteredTextFieldCell' => 'Xamarin.Forms.Platform.MacOS.VerticallyCenteredTextFieldCell, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7230 /* #218 'Xamarin_Forms_Platform_MacOS_NativeViewWrapperRenderer' => 'Xamarin.Forms.Platform.MacOS.NativeViewWrapperRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7730 /* #219 'Xamarin_Forms_Platform_MacOS_LabelRenderer' => 'Xamarin.Forms.Platform.MacOS.LabelRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7B30 /* #220 'Xamarin_Forms_Platform_MacOS_ViewRenderer' => 'Xamarin.Forms.Platform.MacOS.ViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9A30 /* #221 'Xamarin_Forms_Platform_MacOS_ShapeRenderer_2' => 'Xamarin.Forms.Platform.MacOS.ShapeRenderer`2, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8C30 /* #222 'Xamarin_Forms_Platform_MacOS_PathRenderer' => 'Xamarin.Forms.Platform.MacOS.PathRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B30 /* #223 'Xamarin_Forms_Platform_MacOS_ShapeView' => 'Xamarin.Forms.Platform.MacOS.ShapeView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8E30 /* #224 'Xamarin_Forms_Platform_MacOS_PathView' => 'Xamarin.Forms.Platform.MacOS.PathView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9030 /* #225 'Xamarin_Forms_Platform_MacOS_EllipseRenderer' => 'Xamarin.Forms.Platform.MacOS.EllipseRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9130 /* #226 'Xamarin_Forms_Platform_MacOS_EllipseView' => 'Xamarin.Forms.Platform.MacOS.EllipseView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9230 /* #227 'Xamarin_Forms_Platform_MacOS_LineRenderer' => 'Xamarin.Forms.Platform.MacOS.LineRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9330 /* #228 'Xamarin_Forms_Platform_MacOS_LineView' => 'Xamarin.Forms.Platform.MacOS.LineView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9430 /* #229 'Xamarin_Forms_Platform_MacOS_PolygonRenderer' => 'Xamarin.Forms.Platform.MacOS.PolygonRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9530 /* #230 'Xamarin_Forms_Platform_MacOS_PolygonView' => 'Xamarin.Forms.Platform.MacOS.PolygonView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9630 /* #231 'Xamarin_Forms_Platform_MacOS_PolylineRenderer' => 'Xamarin.Forms.Platform.MacOS.PolylineRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9730 /* #232 'Xamarin_Forms_Platform_MacOS_PolylineView' => 'Xamarin.Forms.Platform.MacOS.PolylineView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9830 /* #233 'Xamarin_Forms_Platform_MacOS_RectangleRenderer' => 'Xamarin.Forms.Platform.MacOS.RectangleRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9930 /* #234 'Xamarin_Forms_Platform_MacOS_RectangleView' => 'Xamarin.Forms.Platform.MacOS.RectangleView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9C30 /* #235 'Xamarin_Forms_Platform_MacOS_ShapeLayer' => 'Xamarin.Forms.Platform.MacOS.ShapeLayer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xAB30 /* #236 'Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer_ViewControllerWrapper' => 'Xamarin.Forms.Platform.MacOS.FlyoutPageRenderer+ViewControllerWrapper, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2330 /* #237 'Xamarin_Forms_Platform_MacOS_ButtonRenderer' => 'Xamarin.Forms.Platform.MacOS.ButtonRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xAF30 /* #238 'Xamarin_Forms_Platform_MacOS_RadioButtonRenderer_FormsNSButton' => 'Xamarin.Forms.Platform.MacOS.RadioButtonRenderer+FormsNSButton, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2B30 /* #239 'Xamarin_Forms_Platform_MacOS_RadioButtonRenderer' => 'Xamarin.Forms.Platform.MacOS.RadioButtonRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB030 /* #240 'Xamarin_Forms_Platform_MacOS_EntryRenderer_FormsNSTextField' => 'Xamarin.Forms.Platform.MacOS.EntryRenderer+FormsNSTextField, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2F30 /* #241 'Xamarin_Forms_Platform_MacOS_EntryRenderer' => 'Xamarin.Forms.Platform.MacOS.EntryRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3030 /* #242 'Xamarin_Forms_Platform_MacOS_EditorRenderer' => 'Xamarin.Forms.Platform.MacOS.EditorRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3330 /* #243 'Xamarin_Forms_Platform_MacOS_ImageRenderer' => 'Xamarin.Forms.Platform.MacOS.ImageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB630 /* #244 'Xamarin_Forms_Platform_MacOS_WebViewRenderer_FormsWebFrameDelegate' => 'Xamarin.Forms.Platform.MacOS.WebViewRenderer+FormsWebFrameDelegate, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3F30 /* #245 'Xamarin_Forms_Platform_MacOS_WebViewRenderer' => 'Xamarin.Forms.Platform.MacOS.WebViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB930 /* #246 'Xamarin_Forms_Platform_MacOS_ListViewRenderer_FormsNSTableView' => 'Xamarin.Forms.Platform.MacOS.ListViewRenderer+FormsNSTableView, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4030 /* #247 'Xamarin_Forms_Platform_MacOS_ListViewRenderer' => 'Xamarin.Forms.Platform.MacOS.ListViewRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4D30 /* #248 'CarouselPageRenderer' => 'Xamarin.Forms.Platform.MacOS.CarouselPageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5030 /* #249 'Xamarin_Forms_Platform_MacOS_TabbedPageRenderer' => 'Xamarin.Forms.Platform.MacOS.TabbedPageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5130 /* #250 'Xamarin_Forms_Platform_MacOS_NavigationPageRenderer' => 'Xamarin.Forms.Platform.MacOS.NavigationPageRenderer, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xCD30 /* #251 'Xamarin_Forms_Platform_MacOS_NativeToolbarTracker_ToolBarItemNSButton' => 'Xamarin.Forms.Platform.MacOS.NativeToolbarTracker+ToolBarItemNSButton, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6130 /* #252 'Xamarin_Forms_Platform_MacOS_NativeToolbarTracker' => 'Xamarin.Forms.Platform.MacOS.NativeToolbarTracker, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF430 /* #253 'Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton_FormsNSButtonCell' => 'Xamarin.Forms.Platform.MacOS.ButtonRenderer+FormsNSButton+FormsNSButtonCell, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xAC30 /* #254 'Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton' => 'Xamarin.Forms.Platform.MacOS.ButtonRenderer+FormsNSButton, Xamarin.Forms.Platform.macOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1 /* #255 'AppDelegate' => 'RedDog.MacOS.AppDelegate, RedDog.MacOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0 },
	};

	static const MTManagedClassMap __xamarin_skipped_map [] = {
		{ 0x20A20, 0x20920 /* 'Foundation.NSArray`1' => 'Foundation.NSArray' */ },
		{ 0x23920, 0x23720 /* 'Foundation.NSSet`1' => 'Foundation.NSSet' */ },
	};

	static const MTAssembly __xamarin_registration_assemblies [] = {
		{ "mscorlib", "59639733-1ced-4233-a866-53305d5603d7" }, 
		{ "RedDog", "b0d285ba-a234-49de-bbc3-d06c13f063de" }, 
		{ "netstandard", "2a64da42-7a34-448c-b7a1-996c85e24072" }, 
		{ "System.Core", "a0950f26-5a9a-4ee6-a260-f31884e6072b" }, 
		{ "System", "807178b9-d9d8-4c58-a0d9-9d100ab5be78" }, 
		{ "Mono.Security", "b1107ad9-0319-498c-be6d-421698491963" }, 
		{ "System.Xml", "b14dfa68-ffcf-4f36-97b5-d7f0d43c03e6" }, 
		{ "System.Numerics", "17f7ee74-4db0-4ebb-ac90-052284e991c6" }, 
		{ "System.Data", "ff07c35d-8226-40ed-904a-9c4b583f4ef9" }, 
		{ "System.Transactions", "dab90839-b83b-4e10-bcfa-15227239645c" }, 
		{ "System.Data.DataSetExtensions", "96b58954-2ed2-4637-83b5-6a1e31e7dc5d" }, 
		{ "System.Drawing.Common", "ba7d651d-f0ce-41ad-b7dc-9c815121da16" }, 
		{ "System.IO.Compression", "878add3a-36b1-45c3-834d-f3d30f5f8cd3" }, 
		{ "System.IO.Compression.FileSystem", "e876f142-dbdd-4197-9e41-1bcc4d29dc0b" }, 
		{ "System.ComponentModel.Composition", "61178e63-5b01-4d9a-8c3c-d44935ccba86" }, 
		{ "System.Net.Http", "aa08d73f-38a9-4279-9eb4-534e16996135" }, 
		{ "Xamarin.Mac", "a351b2a0-ca13-4ea7-a02e-967f305bca3e" }, 
		{ "System.Runtime.Serialization", "b896b39f-73ec-4bff-84a4-59fc00baefaf" }, 
		{ "System.ServiceModel.Internals", "f3ca6195-2a88-4035-92a4-ec98f72517a7" }, 
		{ "System.Web.Services", "d660a03f-30fd-445e-8881-e19007c52ec8" }, 
		{ "System.Xml.Linq", "692a0528-b2a0-423a-b72d-024a785fa61b" }, 
		{ "Xamarin.Forms.Xaml", "c64258db-a1a7-4420-8ded-f67e7a251d9b" }, 
		{ "Xamarin.Forms.Core", "d94e2f1a-8591-4d9d-a1fd-09356f374550" }, 
		{ "Xamarin.Forms.Platform", "c137c08a-5994-4e2c-b7eb-8c5df53ee256" }, 
		{ "Xamarin.Forms.Platform.macOS", "07221176-c962-4f6e-93eb-c4967e7df86e" }, 
		{ "Microsoft.Win32.Primitives", "7933f5e3-cd1e-4967-ba9f-efce39c1d66a" }, 
		{ "Microsoft.Win32.Registry.AccessControl", "eb81a864-f2b6-4436-a61c-41326735c405" }, 
		{ "Microsoft.Win32.Registry", "2171c2c7-2276-46a8-808f-9d01db18c955" }, 
		{ "System.AppContext", "558eb1ff-c467-4fbf-85df-68748232d914" }, 
		{ "System.Buffers", "f3ed66a5-c6df-46d4-b32b-d144097aaeba" }, 
		{ "System.Collections.Concurrent", "ab2702d8-97a0-4f83-8686-7c3e71a69fff" }, 
		{ "System.Collections", "445aa35a-ea86-46fa-84db-4beae1723fb6" }, 
		{ "System.Collections.NonGeneric", "ac801d37-6cc8-4e13-b3bf-6a79df3a256c" }, 
		{ "System.Collections.Specialized", "47c7680a-852c-4f6e-95f4-c58ee7f8085c" }, 
		{ "System.ComponentModel.Annotations", "1ee9eb27-2e1f-4691-8790-b8f62009ad5d" }, 
		{ "System.ComponentModel.DataAnnotations", "bea9595e-b8af-40c0-abd1-11181d7561d1" }, 
		{ "System.ComponentModel", "01c220e5-39f3-44ec-8dc1-d36554c8c9f7" }, 
		{ "System.ComponentModel.EventBasedAsync", "d23375bc-5f80-4751-90de-c0a0fe00feb4" }, 
		{ "System.ComponentModel.Primitives", "1a5622bf-588c-455e-9d93-d8ddd438b814" }, 
		{ "System.ComponentModel.TypeConverter", "f8100501-e08b-45a6-9d25-3e9ed9a23054" }, 
		{ "System.Console", "e3c1ef18-aa94-4333-82e7-7cf73896fd2d" }, 
		{ "System.Data.Common", "4a01d280-bf8f-4fa9-a7cc-b3e1f6507e2d" }, 
		{ "System.Data.SqlClient", "b1a6a65d-0b5f-4845-9b6e-563fd64b4cb7" }, 
		{ "System.Diagnostics.Contracts", "cf6dc912-d383-4526-932d-19ddbf109693" }, 
		{ "System.Diagnostics.Debug", "2d399a9f-df27-4879-bb11-b7dfd7a7d51b" }, 
		{ "System.Diagnostics.FileVersionInfo", "68e8c1ed-a4c6-4dbf-a13a-76a926aa3aa3" }, 
		{ "System.Diagnostics.Process", "ae0e11d3-dcb4-47ea-abd7-20e9ff04cd54" }, 
		{ "System.Diagnostics.StackTrace", "40f24798-5ddd-4ba8-a9e8-a2d93268edd9" }, 
		{ "System.Diagnostics.TextWriterTraceListener", "ace898dc-106f-4982-bcae-c3062085e82b" }, 
		{ "System.Diagnostics.Tools", "5298cb59-d381-4182-8f7b-1cbfc26b6799" }, 
		{ "System.Diagnostics.TraceEvent", "03db8bf2-a538-4c42-9dff-535ef71a0df2" }, 
		{ "System.Diagnostics.TraceSource", "e3adfb1a-515c-45d7-b452-2c0700747332" }, 
		{ "System.Diagnostics.Tracing", "ec1de3f2-554c-4e30-9d7f-53d80a5eabb0" }, 
		{ "System.Drawing.Primitives", "58b6a553-69df-4b1f-b7d8-f5288ee9a3ed" }, 
		{ "System.Dynamic.Runtime", "574d5b39-c251-4674-a991-776ba66be648" }, 
		{ "System.Globalization.Calendars", "28b1b89c-91dd-4b69-974e-904a75d7088b" }, 
		{ "System.Globalization", "8c852e53-26c5-4ba9-8176-88ca8cca1b9d" }, 
		{ "System.Globalization.Extensions", "5f87c686-7644-45f3-80b9-ea47606907ad" }, 
		{ "System.IO.Compression.ZipFile", "a7ca4aeb-c057-4c46-9af6-0912379f0075" }, 
		{ "System.IO", "0a133204-8a78-4db6-a267-32f89beb16ea" }, 
		{ "System.IO.FileSystem.AccessControl", "c9dd99fd-4484-496c-b9e5-d38cba2fda08" }, 
		{ "System.IO.FileSystem", "569c2138-12ac-415c-8fc5-668c3139fc88" }, 
		{ "System.IO.FileSystem.DriveInfo", "1afe5d0b-cac3-4c2f-9c87-1c7215d8c0cd" }, 
		{ "System.IO.FileSystem.Primitives", "8f47ae37-e3d1-4330-9f02-b22de3da75e9" }, 
		{ "System.IO.FileSystem.Watcher", "e6cd30f4-8528-4ee7-94ac-68930df5c3fc" }, 
		{ "System.IO.IsolatedStorage", "5908fc0f-72e5-4d82-99dd-1649a0b89e33" }, 
		{ "System.IO.MemoryMappedFiles", "ff7b512f-6e67-4675-9c91-e618c3273e76" }, 
		{ "System.IO.Pipes", "0e707e51-f131-4de0-b94b-c947c132c966" }, 
		{ "System.IO.UnmanagedMemoryStream", "b0fc72be-65c0-4ce3-82cc-94b72ca8e561" }, 
		{ "System.Linq", "cf22f0a8-ce77-4e9a-8f22-60d5dd9bb719" }, 
		{ "System.Linq.Expressions", "d0a4f364-29c7-443a-bf62-2ebe02cef075" }, 
		{ "System.Linq.Parallel", "a26e61b3-df82-4289-80e5-9a88305ba2bc" }, 
		{ "System.Linq.Queryable", "2404323e-ee52-4cb2-bb8d-1014e325f7bd" }, 
		{ "System.Memory", "24a92820-8a91-4489-985a-565d37c1904f" }, 
		{ "System.Net.AuthenticationManager", "3caa0881-ee60-4495-8204-96d36172f861" }, 
		{ "System.Net.Cache", "d8dc4091-8f74-447b-9651-4fa7f1fc8bda" }, 
		{ "System.Net.HttpListener", "c03bdcfc-64c3-453a-a9d0-5fe7797fc88f" }, 
		{ "System.Net.Mail", "1ea50be9-262f-40b0-b57e-0de27152b1b7" }, 
		{ "System.Net.NameResolution", "f43a88ab-65b8-4c04-87a5-1ed2afd42398" }, 
		{ "System.Net.NetworkInformation", "3791580b-f53e-4625-9004-2e0e156b5dd3" }, 
		{ "System.Net.Ping", "f061a625-f160-41bc-a431-fc4699e4a440" }, 
		{ "System.Net.Primitives", "2ea30488-f8a8-40e1-b03d-9721a41283b8" }, 
		{ "System.Net.Requests", "d4686e13-a7fe-483e-95c3-610f33c234c3" }, 
		{ "System.Net.Security", "c5320889-7711-4bcc-a068-9f22ecafa43f" }, 
		{ "System.Net.ServicePoint", "2ddd9747-21a1-4c53-8f63-0ce956717e88" }, 
		{ "System.Net.Sockets", "ab0b8df1-6723-42d7-a6ce-2bfac82752a1" }, 
		{ "System.Net.Utilities", "23f12b87-64b9-4c8e-9f6d-3f5bfcce1825" }, 
		{ "System.Net.WebHeaderCollection", "5271ceea-b2b3-4e74-a5d3-91d3c6077d97" }, 
		{ "System.Net.WebSockets.Client", "aa518d8e-8a7f-4044-ba55-34e6a5199162" }, 
		{ "System.Net.WebSockets", "7a842de9-d019-423e-a5fe-c835046b144d" }, 
		{ "System.ObjectModel", "c138ff4e-ded1-4c27-b9d3-27bf3bbff254" }, 
		{ "System.Reflection.DispatchProxy", "1b7aed8c-5976-4b88-a42a-6861592c692b" }, 
		{ "System.Reflection", "254e09d7-c57b-4399-8c84-00f54177a638" }, 
		{ "System.Reflection.Emit", "3ca3f29f-f4ce-4f18-ba99-b93431ed6ded" }, 
		{ "System.Reflection.Emit.ILGeneration", "86dc7697-a72f-40b3-b38c-a7bc949aafae" }, 
		{ "System.Reflection.Emit.Lightweight", "0f5f3e71-3462-4a17-883f-c74e6e6ef55f" }, 
		{ "System.Reflection.Extensions", "9d83b68a-5924-4370-928b-7c8ec14344a0" }, 
		{ "System.Reflection.Primitives", "94637688-1de2-4389-95bb-5f294c51934d" }, 
		{ "System.Reflection.TypeExtensions", "fea456f7-78d7-486a-8d73-e417f4a92eab" }, 
		{ "System.Resources.Reader", "c8e18073-4b77-457a-8984-5a48368cc318" }, 
		{ "System.Resources.ReaderWriter", "2a5faf72-175b-42bd-b690-f91957cf654a" }, 
		{ "System.Resources.ResourceManager", "858033b9-99ff-46a1-828a-8d67074a85ed" }, 
		{ "System.Resources.Writer", "98b84867-17a4-4ba6-9c98-f5a870325dbe" }, 
		{ "System.Runtime.CompilerServices.VisualC", "822f85c2-f873-4abe-8fbf-96fb5b0851a7" }, 
		{ "System.Runtime", "1276392b-b824-4a83-85d5-50ec6d0e8acf" }, 
		{ "System.Runtime.Extensions", "4b44b311-85f2-43b2-bf3e-e7a0d1298217" }, 
		{ "System.Runtime.Handles", "bdf8b57b-51e9-48dd-9c2d-0c71e4c233e3" }, 
		{ "System.Runtime.InteropServices", "1dd466d3-dd1c-4701-925b-002d900be5f3" }, 
		{ "System.Runtime.InteropServices.RuntimeInformation", "dc7a6173-976e-4356-90c4-d3a47bee42c4" }, 
		{ "System.Runtime.InteropServices.WindowsRuntime", "9f076af5-9725-4ac1-a476-5a8649701e06" }, 
		{ "System.Runtime.Loader", "c0068b46-9c85-4dec-a09d-b34d15c917f0" }, 
		{ "System.Runtime.Numerics", "32eeb674-92d4-41a3-b9bc-ca790924fe73" }, 
		{ "System.Runtime.Serialization.Formatters", "0328d044-100f-4cbb-b37b-8a0fe94461a6" }, 
		{ "System.Runtime.Serialization.Json", "4108d79b-c6c3-4116-bc50-e9bb556918ac" }, 
		{ "System.Runtime.Serialization.Primitives", "a893c645-6b20-4b6f-9a78-59f3d632f050" }, 
		{ "System.Runtime.Serialization.Xml", "c4f67653-04a1-4f5a-8857-e6331ad465d8" }, 
		{ "System.Security.AccessControl", "cc1bbafe-57e6-48e4-96e2-2194505f96cb" }, 
		{ "System.Security.Claims", "18955cb9-51a9-468f-b341-3bccee5a2489" }, 
		{ "System.Security.Cryptography.Algorithms", "40291730-775f-4d6a-9b37-da53616e06a8" }, 
		{ "System.Security.Cryptography.Cng", "ece87580-65b2-4ba8-869f-dd29b1e5c0bf" }, 
		{ "System.Security.Cryptography.Csp", "de90e618-185c-40fd-8c35-b75a970a862e" }, 
		{ "System.Security.Cryptography.DeriveBytes", "3b32d58e-c7d6-4551-be73-7850da47568d" }, 
		{ "System.Security.Cryptography.Encoding", "121a3e29-e987-498e-9fce-a8e7b8c670df" }, 
		{ "System.Security.Cryptography.Encryption.Aes", "66c43e2a-113a-4b2a-a198-efffb6ab46c0" }, 
		{ "System.Security.Cryptography.Encryption", "8ff14537-2826-42de-ba0d-67a93cb689a5" }, 
		{ "System.Security.Cryptography.Encryption.ECDiffieHellman", "bbda3503-8a66-4d68-88a3-752ff558fc1a" }, 
		{ "System.Security.Cryptography.Encryption.ECDsa", "91cde150-7f35-43aa-8d53-85704857789a" }, 
		{ "System.Security.Cryptography.Hashing.Algorithms", "eefe29fd-1475-4e70-ab6e-48343b59e3b5" }, 
		{ "System.Security.Cryptography.Hashing", "5ead7dd2-15b2-4639-a6ff-abdf28310e08" }, 
		{ "System.Security.Cryptography.OpenSsl", "1c36d2b4-c81e-4127-ac0e-480bc59279a8" }, 
		{ "System.Security.Cryptography.Pkcs", "d9699487-601f-445c-a0c0-21bb896e0a96" }, 
		{ "System.Security", "2bc9c5cc-ff0f-4250-9461-4a1e6b53d952" }, 
		{ "System.Security.Cryptography.Primitives", "9a845c7c-3a41-4f90-b7ec-2e0a8d9f2106" }, 
		{ "System.Security.Cryptography.ProtectedData", "45751a75-4c65-45db-9ca0-8d545a053b49" }, 
		{ "System.Security.Cryptography.RandomNumberGenerator", "b5248f69-b124-47c3-839b-c8d259f718c5" }, 
		{ "System.Security.Cryptography.RSA", "9859dcb7-eafb-42b5-82ad-059c08af2fa0" }, 
		{ "System.Security.Cryptography.X509Certificates", "2dd3441a-f637-4ffb-9db5-4a7eb5c35477" }, 
		{ "System.Security.Principal", "00bf80c7-e375-470c-b986-1ccd128d1918" }, 
		{ "System.Security.Principal.Windows", "1f76e39e-363c-4435-bfa7-7f0028a2055d" }, 
		{ "System.Security.SecureString", "37bd4884-797f-4023-87a6-5f4e10b37bd6" }, 
		{ "System.ServiceModel.Duplex", "ba0b246d-824c-4797-a4cd-0760005e36f2" }, 
		{ "System.ServiceModel", "a6c6feec-ee63-45af-a5de-96e7f9f6ed0f" }, 
		{ "System.IdentityModel", "eaa86724-76a1-41bf-8fee-4d3dfe5be56f" }, 
		{ "System.ServiceModel.Http", "ddb1ee10-8cd7-41b5-ae16-52e5ae5efb0d" }, 
		{ "System.ServiceModel.NetTcp", "f91149f2-576b-4365-bde8-4781a5c49482" }, 
		{ "System.ServiceModel.Primitives", "f7e068e7-0545-4712-9c20-ef648ac693e3" }, 
		{ "System.ServiceModel.Security", "66c6af3f-6fa4-4818-bbeb-31440d445559" }, 
		{ "System.ServiceProcess.ServiceController", "5cb948fe-ef4e-46d6-8ad0-7c195d355955" }, 
		{ "System.Text.Encoding.CodePages", "bf86b7b6-8a49-447c-b35d-c01020c339bc" }, 
		{ "System.Text.Encoding", "ab00b7fa-854a-4ab2-9382-b2ebfdf96d7b" }, 
		{ "System.Text.Encoding.Extensions", "42329a46-4f4d-41a3-b9dc-e294afb8beda" }, 
		{ "System.Text.RegularExpressions", "cb99df8b-f6e9-490f-9a65-e0557ce8274e" }, 
		{ "System.Threading.AccessControl", "c45b8d21-52b3-4cae-a6ff-6f6788699a49" }, 
		{ "System.Threading", "41ddade7-3378-4eab-9e8c-f5bf232513f9" }, 
		{ "System.Threading.Overlapped", "713ef4ad-2397-4f4f-92be-d20cefcf9394" }, 
		{ "System.Threading.Tasks", "c9f85bc2-fba4-4c71-9d02-1d9e3510ee3d" }, 
		{ "System.Threading.Tasks.Extensions", "8e5b6229-d7ad-4bf4-a9fe-c326812c3d8e" }, 
		{ "System.Threading.Tasks.Parallel", "e64e06ae-f227-4015-866c-62510d69ed90" }, 
		{ "System.Threading.Thread", "84a20e5e-2c7c-4e1e-bbcc-98d72b34fc53" }, 
		{ "System.Threading.ThreadPool", "b734c56d-8a6b-4d12-b5da-f6b77a2c731f" }, 
		{ "System.Threading.Timer", "ca76d657-dc4a-4949-9aef-ca6ceed494b9" }, 
		{ "System.ValueTuple", "aa5000d0-1614-460e-9901-698c0bba5a1d" }, 
		{ "System.Xml.ReaderWriter", "d43d42b4-3151-42e1-b710-3aa280271abe" }, 
		{ "System.Xml.XDocument", "dab43d10-f2be-4ca6-93a0-caa39e51e54b" }, 
		{ "System.Xml.XmlDocument", "36a1c111-cde3-4781-9177-bafbac781427" }, 
		{ "System.Xml.XmlSerializer", "70e7453d-0fa3-49fa-89aa-a7381a5a6447" }, 
		{ "System.Xml.XPath", "7f84278d-b6e8-4998-84a7-c44e2577ff7d" }, 
		{ "System.Xml.XPath.XDocument", "61eb357e-32ed-4a1d-94e6-cc5d4a11a075" }, 
		{ "System.Xml.XPath.XmlDocument", "010e898e-d8b2-4b15-bf75-e8dc0d421263" }, 
		{ "System.Xml.Xsl.Primitives", "f7c424ab-8277-4c9a-9147-7b6857f36431" }, 
		{ "RedDog.MacOS", "89071497-6990-4209-8437-aeb77b794aee" }
	};

	static const MTFullTokenReference __xamarin_token_references [] = {
		{ /* #1 = 0x1 */ 170 /* RedDog.MacOS */, 0x1 /* RedDog.MacOS.exe */, 0x2000003 /* RedDog.MacOS.AppDelegate */ },
		{ /* #2 = 0x3 */ 170 /* RedDog.MacOS */, 0x1 /* RedDog.MacOS.exe */, 0x6000004 /* System.Void RedDog.MacOS.AppDelegate::DidFinishLaunching(Foundation.NSNotification) */ },
		{ /* #3 = 0x5 */ 170 /* RedDog.MacOS */, 0x1 /* RedDog.MacOS.exe */, 0x6000002 /* System.Void RedDog.MacOS.AppDelegate::.ctor() */ },

	};

	static const MTProtocolWrapperMap __xamarin_protocol_wrapper_map [] = {
		{ 0x1820 /* WebKit.IWebFrameLoadDelegate */, 0x1920 /* WebFrameLoadDelegateWrapper */ },
		{ 0x1C20 /* WebKit.IWebPolicyDecisionListener */, 0x1E20 /* WebPolicyDecisionListenerWrapper */ },
		{ 0x1F20 /* WebKit.IWebPolicyDelegate */, 0x2020 /* WebPolicyDelegateWrapper */ },
		{ 0xB120 /* AppKit.INSApplicationDelegate */, 0xB320 /* NSApplicationDelegateWrapper */ },
		{ 0xCB20 /* AppKit.INSDatePickerCellDelegate */, 0xCC20 /* NSDatePickerCellDelegateWrapper */ },
		{ 0xD520 /* AppKit.INSGestureRecognizerDelegate */, 0xD620 /* NSGestureRecognizerDelegateWrapper */ },
		{ 0xE820 /* AppKit.INSPageControllerDelegate */, 0xE920 /* NSPageControllerDelegateWrapper */ },
		{ 0xEE20 /* AppKit.INSPreviewRepresentableActivityItem */, 0xEF20 /* NSPreviewRepresentableActivityItemWrapper */ },
		{ 0x11820 /* AppKit.INSTextFieldDelegate */, 0x11920 /* NSTextFieldDelegateWrapper */ },
		{ 0x11E20 /* AppKit.INSToolbarDelegate */, 0x11F20 /* NSToolbarDelegateWrapper */ },
		{ 0x12C20 /* AppKit.INSWindowDelegate */, 0x12D20 /* NSWindowDelegateWrapper */ },
	};

	static struct MTRegistrationMap __xamarin_registration_map = {
		"9defd91b37e5b4c3ab1f63e3ca77095d09aa4c93",
		__xamarin_registration_assemblies,
		__xamarin_class_map,
		__xamarin_token_references,
		__xamarin_skipped_map,
		__xamarin_protocol_wrapper_map,
		{ NULL, NULL },
		171,
		256,
		3,
		2,
		11,
		0
	};

void xamarin_create_classes () {
	__xamarin_class_map [0].handle = objc_getClass ("NSObject");
	__xamarin_class_map [1].handle = objc_getClass ("JSContext");
	__xamarin_class_map [2].handle = objc_getClass ("INIntent");
	__xamarin_class_map [3].handle = objc_getClass ("WebFrame");
	__xamarin_class_map [4].handle = objc_getClass ("WebPolicyDelegate");
	__xamarin_class_map [5].handle = objc_getClass ("WebFrameLoadDelegate");
	__xamarin_class_map [6].handle = objc_getClass ("WebScriptObject");
	__xamarin_class_map [7].handle = objc_getClass ("CIFilter");
	__xamarin_class_map [8].handle = objc_getClass ("CIVector");
	__xamarin_class_map [9].handle = objc_getClass ("CoreImage_CIColorCrossPolynomial");
	__xamarin_class_map [10].handle = objc_getClass ("CoreImage_CIColorPolynomial");
	__xamarin_class_map [11].handle = objc_getClass ("CALayer");
	__xamarin_class_map [12].handle = objc_getClass ("CAGradientLayer");
	__xamarin_class_map [13].handle = objc_getClass ("CALayerDelegate");
	__xamarin_class_map [14].handle = objc_getClass ("CAShapeLayer");
	__xamarin_class_map [15].handle = objc_getClass ("CATransaction");
	__xamarin_class_map [16].handle = objc_getClass ("CKShareMetadata");
	__xamarin_class_map [17].handle = objc_getClass ("__monomac_internal_ActionDispatcher");
	__xamarin_class_map [18].handle = objc_getClass ("NSParagraphStyle");
	__xamarin_class_map [19].handle = objc_getClass ("NSMutableParagraphStyle");
	__xamarin_class_map [20].handle = objc_getClass ("NSCell");
	__xamarin_class_map [21].handle = objc_getClass ("NSActionCell");
	__xamarin_class_map [22].handle = objc_getClass ("__MonoMac_NSAlertDidEndDispatcher");
	__xamarin_class_map [23].handle = objc_getClass ("NSBezierPath");
	__xamarin_class_map [24].handle = objc_getClass ("NSResponder");
	__xamarin_class_map [25].handle = objc_getClass ("NSView");
	__xamarin_class_map [26].handle = objc_getClass ("NSControl");
	__xamarin_class_map [27].handle = objc_getClass ("NSButton");
	__xamarin_class_map [28].handle = objc_getClass ("NSColor");
	__xamarin_class_map [29].handle = objc_getClass ("NSEvent");
	__xamarin_class_map [30].handle = objc_getClass ("NSFont");
	__xamarin_class_map [31].handle = objc_getClass ("NSGraphicsContext");
	__xamarin_class_map [32].handle = objc_getClass ("NSImage");
	__xamarin_class_map [33].handle = objc_getClass ("NSImageRep");
	__xamarin_class_map [34].handle = objc_getClass ("NSLayoutManager");
	__xamarin_class_map [35].handle = objc_getClass ("NSMenuItem");
	__xamarin_class_map [36].handle = objc_getClass ("NSPasteboard");
	__xamarin_class_map [37].handle = objc_getClass ("NSPopUpButton");
	__xamarin_class_map [38].handle = objc_getClass ("NSButtonCell");
	__xamarin_class_map [39].handle = objc_getClass ("NSMenuItemCell");
	__xamarin_class_map [40].handle = objc_getClass ("NSPopUpButtonCell");
	__xamarin_class_map [41].handle = objc_getClass ("NSScreen");
	__xamarin_class_map [42].handle = objc_getClass ("NSSlider");
	__xamarin_class_map [43].handle = objc_getClass ("NSTextContainer");
	__xamarin_class_map [44].handle = objc_getClass ("NSAttributedString");
	__xamarin_class_map [45].handle = objc_getClass ("NSMutableAttributedString");
	__xamarin_class_map [46].handle = objc_getClass ("NSTextStorage");
	__xamarin_class_map [47].handle = objc_getClass ("NSToolbarItem");
	__xamarin_class_map [48].handle = objc_getClass ("NSTouch");
	__xamarin_class_map [49].handle = objc_getClass ("NSWorkspace");
	__xamarin_class_map [50].handle = objc_getClass ("NSLayoutConstraint");
	__xamarin_class_map [51].handle = objc_getClass ("NSAnimationContext");
	__xamarin_class_map [52].handle = objc_getClass ("NSAppearance");
	__xamarin_class_map [53].handle = objc_getClass ("NSApplicationDelegate");
	__xamarin_class_map [54].handle = objc_getClass ("NSClipView");
	__xamarin_class_map [55].handle = objc_getClass ("NSColorSpace");
	__xamarin_class_map [56].handle = objc_getClass ("NSCursor");
	__xamarin_class_map [57].handle = objc_getClass ("NSDatePickerCell");
	__xamarin_class_map [58].handle = objc_getClass ("NSFontDescriptor");
	__xamarin_class_map [59].handle = objc_getClass ("NSGlyphInfo");
	__xamarin_class_map [60].handle = objc_getClass ("NSImageView");
	__xamarin_class_map [61].handle = objc_getClass ("NSLayoutAnchor");
	__xamarin_class_map [62].handle = objc_getClass ("NSLayoutXAxisAnchor");
	__xamarin_class_map [63].handle = objc_getClass ("NSLayoutYAxisAnchor");
	__xamarin_class_map [64].handle = objc_getClass ("NSMenu");
	__xamarin_class_map [65].handle = objc_getClass ("NSPageControllerDelegate");
	__xamarin_class_map [66].handle = objc_getClass ("NSWindow");
	__xamarin_class_map [67].handle = objc_getClass ("NSPanel");
	__xamarin_class_map [68].handle = objc_getClass ("NSPrintPreviewGraphicsContext");
	__xamarin_class_map [69].handle = objc_getClass ("NSProgressIndicator");
	__xamarin_class_map [70].handle = objc_getClass ("NSScrollView");
	__xamarin_class_map [71].handle = objc_getClass ("NSTextFieldCell");
	__xamarin_class_map [72].handle = objc_getClass ("NSSearchFieldCell");
	__xamarin_class_map [73].handle = objc_getClass ("NSTextField");
	__xamarin_class_map [74].handle = objc_getClass ("NSSecureTextField");
	__xamarin_class_map [75].handle = objc_getClass ("NSShadow");
	__xamarin_class_map [76].handle = objc_getClass ("NSSliderCell");
	__xamarin_class_map [77].handle = objc_getClass ("NSSplitView");
	__xamarin_class_map [78].handle = objc_getClass ("NSViewController");
	__xamarin_class_map [79].handle = objc_getClass ("NSSplitViewController");
	__xamarin_class_map [80].handle = objc_getClass ("NSSplitViewItem");
	__xamarin_class_map [81].handle = objc_getClass ("NSStepper");
	__xamarin_class_map [82].handle = objc_getClass ("NSSwitch");
	__xamarin_class_map [83].handle = objc_getClass ("NSTableColumn");
	__xamarin_class_map [84].handle = objc_getClass ("NSTableHeaderView");
	__xamarin_class_map [85].handle = objc_getClass ("NSTableRowView");
	__xamarin_class_map [86].handle = objc_getClass ("NSTableViewRowAction");
	__xamarin_class_map [87].handle = objc_getClass ("NSTableViewSource");
	__xamarin_class_map [88].handle = objc_getClass ("NSTabView");
	__xamarin_class_map [89].handle = objc_getClass ("NSTabViewController");
	__xamarin_class_map [90].handle = objc_getClass ("NSTabViewItem");
	__xamarin_class_map [91].handle = objc_getClass ("NSText");
	__xamarin_class_map [92].handle = objc_getClass ("NSTextAlternatives");
	__xamarin_class_map [93].handle = objc_getClass ("NSTextAttachment");
	__xamarin_class_map [94].handle = objc_getClass ("NSTextView");
	__xamarin_class_map [95].handle = objc_getClass ("NSToolbarDelegate");
	__xamarin_class_map [96].handle = objc_getClass ("NSToolbarItemGroup");
	__xamarin_class_map [97].handle = objc_getClass ("NSError");
	__xamarin_class_map [98].handle = objc_getClass ("NSUserActivity");
	__xamarin_class_map [99].handle = objc_getClass ("Foundation_NSDispatcher");
	__xamarin_class_map [100].handle = objc_getClass ("__MonoMac_NSSynchronizationContextDispatcher");
	__xamarin_class_map [101].handle = objc_getClass ("__Xamarin_NSTimerActionDispatcher");
	__xamarin_class_map [102].handle = objc_getClass ("Foundation_NSAsyncDispatcher");
	__xamarin_class_map [103].handle = objc_getClass ("__MonoMac_NSAsyncActionDispatcher");
	__xamarin_class_map [104].handle = objc_getClass ("__MonoMac_NSAsyncSynchronizationContextDispatcher");
	__xamarin_class_map [105].handle = objc_getClass ("NSArray");
	__xamarin_class_map [106].handle = objc_getClass ("NSAutoreleasePool");
	__xamarin_class_map [107].handle = objc_getClass ("NSBundle");
	__xamarin_class_map [108].handle = objc_getClass ("NSCalendar");
	__xamarin_class_map [109].handle = objc_getClass ("NSCoder");
	__xamarin_class_map [110].handle = objc_getClass ("NSDate");
	__xamarin_class_map [111].handle = objc_getClass ("NSIndexPath");
	__xamarin_class_map [112].handle = objc_getClass ("NSItemProvider");
	__xamarin_class_map [113].handle = objc_getClass ("NSURLRequest");
	__xamarin_class_map [114].handle = objc_getClass ("Foundation_InternalNSNotificationHandler");
	__xamarin_class_map [115].handle = objc_getClass ("NSNull");
	__xamarin_class_map [116].handle = objc_getClass ("NSValue");
	__xamarin_class_map [117].handle = objc_getClass ("NSNumber");
	__xamarin_class_map [118].handle = objc_getClass ("NSRunLoop");
	__xamarin_class_map [119].handle = objc_getClass ("NSSet");
	__xamarin_class_map [120].handle = objc_getClass ("NSString");
	__xamarin_class_map [121].handle = objc_getClass ("NSThread");
	__xamarin_class_map [122].handle = objc_getClass ("NSTimeZone");
	__xamarin_class_map [123].handle = objc_getClass ("NSTimer");
	__xamarin_class_map [124].handle = objc_getClass ("NSUndoManager");
	__xamarin_class_map [125].handle = objc_getClass ("NSURL");
	__xamarin_class_map [126].handle = objc_getClass ("NSUserDefaults");
	__xamarin_class_map [127].handle = objc_getClass ("NSNotificationCenter");
	__xamarin_class_map [128].handle = objc_getClass ("NSDistributedNotificationCenter");
	__xamarin_class_map [129].handle = objc_getClass ("NSEnumerator");
	__xamarin_class_map [130].handle = objc_getClass ("NSException");
	__xamarin_class_map [131].handle = objc_getClass ("NSIndexSet");
	__xamarin_class_map [132].handle = objc_getClass ("NSMutableIndexSet");
	__xamarin_class_map [133].handle = objc_getClass ("NSNotification");
	__xamarin_class_map [134].handle = objc_getClass ("NSProcessInfo");
	__xamarin_class_map [135].handle = objc_getClass ("NSTextCheckingResult");
	__xamarin_class_map [136].handle = objc_getClass ("WebKit_WebView__WebFrameLoadDelegate");
	__xamarin_class_map [137].handle = objc_getClass ("WebKit_WebView__WebPolicyDelegate");
	__xamarin_class_map [138].handle = objc_getClass ("WebView");
	__xamarin_class_map [139].handle = objc_getClass ("AppKit_NSApplication__NSApplicationDelegate");
	__xamarin_class_map [140].handle = objc_getClass ("NSApplication");
	__xamarin_class_map [141].handle = objc_getClass ("AppKit_NSTableView__NSTableViewDelegate");
	__xamarin_class_map [142].handle = objc_getClass ("NSTableView");
	__xamarin_class_map [143].handle = objc_getClass ("NSAlert");
	__xamarin_class_map [144].handle = objc_getClass ("__NSGestureRecognizerToken");
	__xamarin_class_map [145].handle = objc_getClass ("__NSGestureRecognizerParameterlessToken");
	__xamarin_class_map [146].handle = objc_getClass ("__NSGestureRecognizerParametrizedToken");
	__xamarin_class_map [147].handle = objc_getClass ("AppKit_NSGestureRecognizer__NSGestureRecognizerDelegate");
	__xamarin_class_map [148].handle = objc_getClass ("NSGestureRecognizer");
	__xamarin_class_map [149].handle = objc_getClass ("__NSClickGestureRecognizer");
	__xamarin_class_map [150].handle = objc_getClass ("NSClickGestureRecognizer");
	__xamarin_class_map [151].handle = objc_getClass ("__NSMagnificationGestureRecognizer");
	__xamarin_class_map [152].handle = objc_getClass ("NSMagnificationGestureRecognizer");
	__xamarin_class_map [153].handle = objc_getClass ("__NSPanGestureRecognizer");
	__xamarin_class_map [154].handle = objc_getClass ("NSPanGestureRecognizer");
	__xamarin_class_map [155].handle = objc_getClass ("__NSPressGestureRecognizer");
	__xamarin_class_map [156].handle = objc_getClass ("NSPressGestureRecognizer");
	__xamarin_class_map [157].handle = objc_getClass ("__NSRotationGestureRecognizer");
	__xamarin_class_map [158].handle = objc_getClass ("NSRotationGestureRecognizer");
	__xamarin_class_map [159].handle = objc_getClass ("AppKit_NSTextField__NSTextFieldDelegate");
	__xamarin_class_map [160].handle = objc_getClass ("AppKit_NSWindow__NSWindowDelegate");
	__xamarin_class_map [161].handle = objc_getClass ("AppKit_NSDatePicker__NSDatePickerCellDelegate");
	__xamarin_class_map [162].handle = objc_getClass ("NSDatePicker");
	__xamarin_class_map [163].handle = objc_getClass ("AppKit_NSPageController__NSPageControllerDelegate");
	__xamarin_class_map [164].handle = objc_getClass ("NSPageController");
	__xamarin_class_map [165].handle = objc_getClass ("AppKit_NSSearchField__NSSearchFieldDelegate");
	__xamarin_class_map [166].handle = objc_getClass ("NSSearchField");
	__xamarin_class_map [167].handle = objc_getClass ("AppKit_NSToolbar__NSToolbarDelegate");
	__xamarin_class_map [168].handle = objc_getClass ("NSToolbar");
	__xamarin_class_map [169].handle = objc_getClass ("NSData");
	__xamarin_class_map [170].handle = objc_getClass ("NSDictionary");
	__xamarin_class_map [171].handle = objc_getClass ("NSMutableData");
	__xamarin_class_map [172].handle = objc_getClass ("NSMutableDictionary");
	__xamarin_class_map [173].handle = objc_getClass ("__NSObject_Disposer");
	__xamarin_class_map [174].handle = [Xamarin_Forms_Platform_macOS_Controls_FormsBoxView class];
	__xamarin_class_map [175].handle = [Xamarin_Forms_Platform_macOS_Controls_FormsNSSlider class];
	__xamarin_class_map [176].handle = [Xamarin_Forms_Platform_MacOS_FormsNSDatePicker class];
	__xamarin_class_map [177].handle = [Xamarin_Forms_Platform_MacOS_FormsApplicationDelegate class];
	__xamarin_class_map [178].handle = [Xamarin_Forms_Platform_MacOS_PlatformRenderer class];
	__xamarin_class_map [179].handle = [Xamarin_Forms_Platform_MacOS_FlippedClipView class];
	__xamarin_class_map [180].handle = [Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer class];
	__xamarin_class_map [181].handle = [Xamarin_Forms_Platform_MacOS_MasterDetailPageRenderer class];
	__xamarin_class_map [182].handle = [Xamarin_Forms_Platform_MacOS_FormsNSView class];
	__xamarin_class_map [183].handle = [Xamarin_Forms_Platform_MacOS_PageRenderer class];
	__xamarin_class_map [184].handle = [Xamarin_Forms_Platform_MacOS_VisualElementRenderer_1 class];
	__xamarin_class_map [185].handle = [Xamarin_Forms_Platform_MacOS_DefaultRenderer class];
	__xamarin_class_map [186].handle = [Xamarin_Forms_Platform_MacOS_ViewRenderer_2 class];
	__xamarin_class_map [187].handle = [Xamarin_Forms_Platform_MacOS_BoxViewRenderer class];
	__xamarin_class_map [188].handle = [Xamarin_Forms_Platform_MacOS_ScrollViewRenderer class];
	__xamarin_class_map [189].handle = [Xamarin_Forms_Platform_MacOS_ActivityIndicatorRenderer class];
	__xamarin_class_map [190].handle = [Xamarin_Forms_Platform_MacOS_DatePickerRenderer class];
	__xamarin_class_map [191].handle = [Xamarin_Forms_Platform_MacOS_FrameRenderer class];
	__xamarin_class_map [192].handle = [Xamarin_Forms_Platform_MacOS_FormsNSImageView class];
	__xamarin_class_map [193].handle = [Xamarin_Forms_Platform_MacOS_OpenGLViewRenderer class];
	__xamarin_class_map [194].handle = [Xamarin_Forms_Platform_MacOS_MacOSOpenGLView class];
	__xamarin_class_map [195].handle = [Xamarin_Forms_Platform_MacOS_PickerRenderer class];
	__xamarin_class_map [196].handle = [Xamarin_Forms_Platform_MacOS_ProgressBarRenderer class];
	__xamarin_class_map [197].handle = [Xamarin_Forms_Platform_MacOS_SearchBarRenderer class];
	__xamarin_class_map [198].handle = [Xamarin_Forms_Platform_MacOS_FormsSliderCell class];
	__xamarin_class_map [199].handle = [Xamarin_Forms_Platform_MacOS_SliderRenderer class];
	__xamarin_class_map [200].handle = [Xamarin_Forms_Platform_MacOS_StepperRenderer class];
	__xamarin_class_map [201].handle = [Xamarin_Forms_Platform_MacOS_CheckBoxRenderer class];
	__xamarin_class_map [202].handle = [Xamarin_Forms_Platform_MacOS_SwitchRenderer class];
	__xamarin_class_map [203].handle = [Xamarin_Forms_Platform_MacOS_TimePickerRenderer class];
	__xamarin_class_map [204].handle = [Xamarin_Forms_Platform_MacOS_CellNSView class];
	__xamarin_class_map [205].handle = [Xamarin_Forms_Platform_MacOS_ViewCellNSView class];
	__xamarin_class_map [206].handle = [Xamarin_Forms_Platform_MacOS_ListViewDataSource class];
	__xamarin_class_map [207].handle = [Xamarin_Forms_Platform_MacOS_CustomNSTableHeaderView class];
	__xamarin_class_map [208].handle = [Xamarin_Forms_Platform_MacOS_FormsPageControllerDelegate class];
	__xamarin_class_map [209].handle = [Xamarin_Forms_Platform_MacOS_NavigationChildPageWrapper class];
	__xamarin_class_map [210].handle = [Xamarin_Forms_Platform_MacOS_NativeViewPropertyListener class];
	__xamarin_class_map [211].handle = [Xamarin_Forms_Platform_MacOS_LayoutRenderer class];
	__xamarin_class_map [212].handle = [Xamarin_Forms_Platform_MacOS_NSPageContainer class];
	__xamarin_class_map [213].handle = [Xamarin_Forms_Platform_MacOS_PageControllerDelegate class];
	__xamarin_class_map [214].handle = [Xamarin_Forms_Platform_MacOS_TableViewRenderer class];
	__xamarin_class_map [215].handle = [Xamarin_Forms_Platform_MacOS_TableViewDataSource class];
	__xamarin_class_map [216].handle = [Xamarin_Forms_Platform_MacOS_UnEvenTableViewModelRenderer class];
	__xamarin_class_map [217].handle = [Xamarin_Forms_Platform_MacOS_VerticallyCenteredTextFieldCell class];
	__xamarin_class_map [218].handle = [Xamarin_Forms_Platform_MacOS_NativeViewWrapperRenderer class];
	__xamarin_class_map [219].handle = [Xamarin_Forms_Platform_MacOS_LabelRenderer class];
	__xamarin_class_map [220].handle = [Xamarin_Forms_Platform_MacOS_ViewRenderer class];
	__xamarin_class_map [221].handle = [Xamarin_Forms_Platform_MacOS_ShapeRenderer_2 class];
	__xamarin_class_map [222].handle = [Xamarin_Forms_Platform_MacOS_PathRenderer class];
	__xamarin_class_map [223].handle = [Xamarin_Forms_Platform_MacOS_ShapeView class];
	__xamarin_class_map [224].handle = [Xamarin_Forms_Platform_MacOS_PathView class];
	__xamarin_class_map [225].handle = [Xamarin_Forms_Platform_MacOS_EllipseRenderer class];
	__xamarin_class_map [226].handle = [Xamarin_Forms_Platform_MacOS_EllipseView class];
	__xamarin_class_map [227].handle = [Xamarin_Forms_Platform_MacOS_LineRenderer class];
	__xamarin_class_map [228].handle = [Xamarin_Forms_Platform_MacOS_LineView class];
	__xamarin_class_map [229].handle = [Xamarin_Forms_Platform_MacOS_PolygonRenderer class];
	__xamarin_class_map [230].handle = [Xamarin_Forms_Platform_MacOS_PolygonView class];
	__xamarin_class_map [231].handle = [Xamarin_Forms_Platform_MacOS_PolylineRenderer class];
	__xamarin_class_map [232].handle = [Xamarin_Forms_Platform_MacOS_PolylineView class];
	__xamarin_class_map [233].handle = [Xamarin_Forms_Platform_MacOS_RectangleRenderer class];
	__xamarin_class_map [234].handle = [Xamarin_Forms_Platform_MacOS_RectangleView class];
	__xamarin_class_map [235].handle = [Xamarin_Forms_Platform_MacOS_ShapeLayer class];
	__xamarin_class_map [236].handle = [Xamarin_Forms_Platform_MacOS_FlyoutPageRenderer_ViewControllerWrapper class];
	__xamarin_class_map [237].handle = [Xamarin_Forms_Platform_MacOS_ButtonRenderer class];
	__xamarin_class_map [238].handle = [Xamarin_Forms_Platform_MacOS_RadioButtonRenderer_FormsNSButton class];
	__xamarin_class_map [239].handle = [Xamarin_Forms_Platform_MacOS_RadioButtonRenderer class];
	__xamarin_class_map [240].handle = [Xamarin_Forms_Platform_MacOS_EntryRenderer_FormsNSTextField class];
	__xamarin_class_map [241].handle = [Xamarin_Forms_Platform_MacOS_EntryRenderer class];
	__xamarin_class_map [242].handle = [Xamarin_Forms_Platform_MacOS_EditorRenderer class];
	__xamarin_class_map [243].handle = [Xamarin_Forms_Platform_MacOS_ImageRenderer class];
	__xamarin_class_map [244].handle = [Xamarin_Forms_Platform_MacOS_WebViewRenderer_FormsWebFrameDelegate class];
	__xamarin_class_map [245].handle = [Xamarin_Forms_Platform_MacOS_WebViewRenderer class];
	__xamarin_class_map [246].handle = [Xamarin_Forms_Platform_MacOS_ListViewRenderer_FormsNSTableView class];
	__xamarin_class_map [247].handle = [Xamarin_Forms_Platform_MacOS_ListViewRenderer class];
	__xamarin_class_map [248].handle = [CarouselPageRenderer class];
	__xamarin_class_map [249].handle = [Xamarin_Forms_Platform_MacOS_TabbedPageRenderer class];
	__xamarin_class_map [250].handle = [Xamarin_Forms_Platform_MacOS_NavigationPageRenderer class];
	__xamarin_class_map [251].handle = [Xamarin_Forms_Platform_MacOS_NativeToolbarTracker_ToolBarItemNSButton class];
	__xamarin_class_map [252].handle = [Xamarin_Forms_Platform_MacOS_NativeToolbarTracker class];
	__xamarin_class_map [253].handle = [Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton_FormsNSButtonCell class];
	__xamarin_class_map [254].handle = [Xamarin_Forms_Platform_MacOS_ButtonRenderer_FormsNSButton class];
	__xamarin_class_map [255].handle = [AppDelegate class];
	xamarin_add_registration_map (&__xamarin_registration_map, false);
}


} /* extern "C" */
